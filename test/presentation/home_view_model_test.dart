// Pengujian unit untuk HomeViewModel.
// Memverifikasi manajemen state reaktif, pemuatan data katalog, filter kategori,
// serta mekanisme pencarian motor sesuai pola MVVM.

import 'package:flutter_test/flutter_test.dart';
import 'package:dealermotor/domain/models/banner_promo.dart';
import 'package:dealermotor/domain/models/motor.dart';
import 'package:dealermotor/domain/models/motor_category.dart';
import 'package:dealermotor/domain/repositories/motor_repository.dart';
import 'package:dealermotor/presentation/viewmodels/home_view_model.dart';

/// Implementasi tiruan (Fake) dari [MotorRepository] untuk kebutuhan pengujian unit ViewModel.
class FakeMotorRepository implements MotorRepository {
  List<Motor> dummyMotors;
  List<BannerPromo> dummyBanners;
  bool shouldThrowError;

  FakeMotorRepository({
    List<Motor>? motors,
    List<BannerPromo>? banners,
    this.shouldThrowError = false,
  })  : dummyMotors = motors ?? _createDummyMotors(),
        dummyBanners = banners ?? _createDummyBanners();

  static List<Motor> _createDummyMotors() {
    return [
      const Motor(
        id: 'beat',
        name: 'BeAT',
        category: MotorCategory.matic,
        price: 18050000,
        images: ['https://example.com/beat.png'],
        specifications: {},
      ),
      const Motor(
        id: 'vario-160',
        name: 'Vario 160',
        category: MotorCategory.matic,
        price: 26639000,
        images: ['https://example.com/vario.png'],
        specifications: {},
      ),
      const Motor(
        id: 'cbr150r',
        name: 'CBR150R',
        category: MotorCategory.sport,
        price: 37000000,
        images: ['https://example.com/cbr.png'],
        specifications: {},
      ),
      const Motor(
        id: 'supra-x-125',
        name: 'Supra X 125',
        category: MotorCategory.cub,
        price: 19100000,
        images: ['https://example.com/supra.png'],
        specifications: {},
      ),
      const Motor(
        id: 'em1-e',
        name: 'EM1 e:',
        category: MotorCategory.ev,
        price: 40000000,
        images: ['https://example.com/em1.png'],
        specifications: {},
      ),
    ];
  }

  static List<BannerPromo> _createDummyBanners() {
    return const [
      BannerPromo(
        id: 'banner-1',
        imageUrl: 'https://example.com/banner1.jpg',
        title: 'Promo Spesial BeAT',
      ),
      BannerPromo(
        id: 'banner-2',
        imageUrl: 'https://example.com/banner2.jpg',
        title: 'Promo EM1 e:',
      ),
    ];
  }

  @override
  Future<List<Motor>> getAllMotors() async {
    if (shouldThrowError) {
      throw Exception('Gagal memuat katalog motor');
    }
    return dummyMotors;
  }

  @override
  Future<List<Motor>> getMotorsByCategory(MotorCategory category) async {
    if (shouldThrowError) {
      throw Exception('Gagal memuat kategori motor');
    }
    return dummyMotors.where((m) => m.category == category).toList();
  }

  @override
  Future<List<Motor>> searchMotors(String query) async {
    if (shouldThrowError) {
      throw Exception('Gagal mencari motor');
    }
    final q = query.toLowerCase().trim();
    if (q.isEmpty) return dummyMotors;
    return dummyMotors
        .where((m) =>
            m.name.toLowerCase().contains(q) || m.id.toLowerCase().contains(q))
        .toList();
  }

  @override
  Future<Motor?> getMotorById(String id) async {
    if (shouldThrowError) {
      throw Exception('Gagal mengambil detail motor');
    }
    try {
      return dummyMotors.firstWhere((m) => m.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<BannerPromo>> getPromotionalBanners() async {
    if (shouldThrowError) {
      throw Exception('Gagal memuat banner promo');
    }
    return dummyBanners;
  }
}

void main() {
  group('HomeViewModel Tests', () {
    late FakeMotorRepository fakeRepository;
    late HomeViewModel viewModel;

    setUp(() {
      fakeRepository = FakeMotorRepository();
      viewModel = HomeViewModel(repository: fakeRepository);
    });

    test('Kondisi awal ViewModel sebelum inisialisasi memiliki nilai default yang tepat', () {
      expect(viewModel.isLoading, isFalse);
      expect(viewModel.allMotors, isEmpty);
      expect(viewModel.displayedMotors, isEmpty);
      expect(viewModel.banners, isEmpty);
      expect(viewModel.selectedCategory, equals(MotorCategory.matic));
      expect(viewModel.searchQuery, isEmpty);
      expect(viewModel.errorMessage, isNull);
    });

    test('initialize memuat daftar motor dan banner, serta menampilkan motor kategori matic', () async {
      // Jalankan inisialisasi
      final future = viewModel.initialize();

      // Pastikan state loading aktif saat proses berjalan
      expect(viewModel.isLoading, isTrue);

      await future;

      // Pastikan data berhasil dimuat
      expect(viewModel.isLoading, isFalse);
      expect(viewModel.errorMessage, isNull);
      expect(viewModel.allMotors.length, equals(5));
      expect(viewModel.banners.length, equals(2));

      // Secara default kategori terpilih adalah matic (BeAT dan Vario 160)
      expect(viewModel.displayedMotors.length, equals(2));
      expect(viewModel.displayedMotors.every((m) => m.category == MotorCategory.matic), isTrue);
    });

    test('initialize menangani error dan mengisi errorMessage jika repositori gagal', () async {
      fakeRepository.shouldThrowError = true;

      await viewModel.initialize();

      expect(viewModel.isLoading, isFalse);
      expect(viewModel.errorMessage, isNotNull);
      expect(viewModel.allMotors, isEmpty);
      expect(viewModel.displayedMotors, isEmpty);
    });

    test('selectCategory mengubah kategori aktif dan memfilter displayedMotors sesuai kategori baru', () async {
      await viewModel.initialize();

      // Pilih kategori Sport
      viewModel.selectCategory(MotorCategory.sport);
      expect(viewModel.selectedCategory, equals(MotorCategory.sport));
      expect(viewModel.displayedMotors.length, equals(1));
      expect(viewModel.displayedMotors.first.id, equals('cbr150r'));

      // Pilih kategori EV
      viewModel.selectCategory(MotorCategory.ev);
      expect(viewModel.selectedCategory, equals(MotorCategory.ev));
      expect(viewModel.displayedMotors.length, equals(1));
      expect(viewModel.displayedMotors.first.id, equals('em1-e'));

      // Pilih kategori Cub
      viewModel.selectCategory(MotorCategory.cub);
      expect(viewModel.selectedCategory, equals(MotorCategory.cub));
      expect(viewModel.displayedMotors.length, equals(1));
      expect(viewModel.displayedMotors.first.id, equals('supra-x-125'));
    });

    test('search memfilter displayedMotors berdasarkan kata kunci nama produk secara case-insensitive', () async {
      await viewModel.initialize();

      // Cari kata kunci 'beat' pada kategori matic
      viewModel.search('beat');
      expect(viewModel.searchQuery, equals('beat'));
      expect(viewModel.displayedMotors.length, equals(1));
      expect(viewModel.displayedMotors.first.name, equals('BeAT'));

      // Cari kata kunci dengan huruf kapital 'VARIO'
      viewModel.search('VARIO');
      expect(viewModel.searchQuery, equals('VARIO'));
      expect(viewModel.displayedMotors.length, equals(1));
      expect(viewModel.displayedMotors.first.name, equals('Vario 160'));

      // Cari query acak yang tidak ada
      viewModel.search('ninja250');
      expect(viewModel.displayedMotors, isEmpty);
    });

    test('clearSearch mengosongkan searchQuery dan mengembalikan daftar motor kategori aktif', () async {
      await viewModel.initialize();

      viewModel.search('beat');
      expect(viewModel.displayedMotors.length, equals(1));

      viewModel.clearSearch();
      expect(viewModel.searchQuery, isEmpty);
      // Kembali menampilkan seluruh motor matic (2 motor)
      expect(viewModel.displayedMotors.length, equals(2));
    });

    test('Pencarian tetap berlaku saat kategori diubah atau sebaliknya', () async {
      await viewModel.initialize();

      // Set pencarian umum
      viewModel.search('1'); // Cocok dengan Vario 160, CBR150R, Supra X 125, EM1 e:

      // Pada kategori matic, hanya Vario 160
      expect(viewModel.displayedMotors.length, equals(1));
      expect(viewModel.displayedMotors.first.name, equals('Vario 160'));

      // Pindah ke kategori Sport saat filter pencarian '1' masih aktif
      viewModel.selectCategory(MotorCategory.sport);
      expect(viewModel.displayedMotors.length, equals(1));
      expect(viewModel.displayedMotors.first.name, equals('CBR150R'));

      // Clear search mengembalikan seluruh motor sport
      viewModel.clearSearch();
      expect(viewModel.displayedMotors.length, equals(1));
      expect(viewModel.displayedMotors.first.name, equals('CBR150R'));
    });
  });
}
