// Pengujian unit untuk DetailViewModel.
// Memverifikasi inisialisasi state, seleksi varian motor, seleksi kategori spesifikasi,
// dan getter pendukung secara reaktif dan aman.

import 'package:dealermotor/domain/models/motor.dart';
import 'package:dealermotor/domain/models/motor_category.dart';
import 'package:dealermotor/presentation/viewmodels/detail_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DetailViewModel Tests', () {
    late Motor testMotor;

    setUp(() {
      testMotor = const Motor(
        id: 'beat-deluxe',
        name: 'BeAT Deluxe',
        category: MotorCategory.matic,
        price: 18050000,
        description: 'Skuter matik Honda BeAT Deluxe modern dan irit.',
        images: [
          'https://example.com/deluxe-black.jpg',
          'https://example.com/deluxe-blue.jpg',
          'https://example.com/deluxe-silver.jpg',
        ],
        colors: [
          'Deluxe Black',
          'Deluxe Blue',
          'Deluxe Silver',
        ],
        specifications: {
          'Mesin': {
            'Tipe Mesin': '4-Langkah, SOHC, eSP',
            'Volume Langkah': '109.5 cc',
            'Daya Maksimum': '6.6 kW / 7.500 rpm',
          },
          'Rangka': {
            'Tipe Rangka': 'eSAF',
            'Rem Depan': 'Cakram Hidrolik',
          },
          'Dimensi': {
            'Berat Kosong': '89 kg',
            'Kapasitas Tangki': '4.2 L',
          },
          'Kelistrikan': {
            'Tipe Baterai': 'MF 12V-5Ah',
            'Sistem Pengapian': 'Full Transistorized',
          },
        },
      );
    });

    test('Inisialisasi ViewModel mengeset state awal secara tepat', () {
      final viewModel = DetailViewModel(motor: testMotor);

      expect(viewModel.motor, equals(testMotor));
      expect(viewModel.selectedVariantIndex, equals(0));
      expect(viewModel.selectedSpecCategory, equals('Mesin'));
      expect(viewModel.currentImage, equals('https://example.com/deluxe-black.jpg'));
      expect(viewModel.currentColorName, equals('Deluxe Black'));
      expect(viewModel.availableSpecCategories, equals(['Mesin', 'Rangka', 'Dimensi', 'Kelistrikan']));
      expect(viewModel.currentSpecifications.length, equals(3));
      expect(viewModel.currentSpecifications['Tipe Mesin'], equals('4-Langkah, SOHC, eSP'));
    });

    test('selectVariant memperbarui selectedVariantIndex, currentImage, dan currentColorName serta memicu notifikasi', () {
      final viewModel = DetailViewModel(motor: testMotor);
      var notified = false;
      viewModel.addListener(() => notified = true);

      viewModel.selectVariant(1);

      expect(notified, isTrue);
      expect(viewModel.selectedVariantIndex, equals(1));
      expect(viewModel.currentImage, equals('https://example.com/deluxe-blue.jpg'));
      expect(viewModel.currentColorName, equals('Deluxe Blue'));

      // Panggil lagi dengan index yang sama, tidak boleh memicu notifikasi ulang
      notified = false;
      viewModel.selectVariant(1);
      expect(notified, isFalse);

      // Panggil dengan index di luar batas tidak mengubah state
      viewModel.selectVariant(99);
      expect(viewModel.selectedVariantIndex, equals(1));

      viewModel.selectVariant(-1);
      expect(viewModel.selectedVariantIndex, equals(1));
    });

    test('selectSpecCategory mengubah kategori spesifikasi aktif dan memperbarui currentSpecifications', () {
      final viewModel = DetailViewModel(motor: testMotor);
      var notified = false;
      viewModel.addListener(() => notified = true);

      viewModel.selectSpecCategory('Rangka');

      expect(notified, isTrue);
      expect(viewModel.selectedSpecCategory, equals('Rangka'));
      expect(viewModel.currentSpecifications.length, equals(2));
      expect(viewModel.currentSpecifications['Tipe Rangka'], equals('eSAF'));
      expect(viewModel.currentSpecifications['Rem Depan'], equals('Cakram Hidrolik'));

      // Panggil kategori yang sama tidak memicu notifikasi ulang
      notified = false;
      viewModel.selectSpecCategory('Rangka');
      expect(notified, isFalse);
    });

    test('Penanganan aman jika spesifikasi atau gambar kosong', () {
      const emptyMotor = Motor(
        id: 'kosong',
        name: 'Motor Kosong',
        category: MotorCategory.sport,
        price: 25000000,
        images: [],
        colors: [],
        specifications: {},
      );

      final viewModel = DetailViewModel(motor: emptyMotor);

      expect(viewModel.selectedVariantIndex, equals(0));
      expect(viewModel.currentImage, isEmpty);
      expect(viewModel.currentColorName, equals('Standar'));
      expect(viewModel.availableSpecCategories, isEmpty);
      expect(viewModel.currentSpecifications, isEmpty);

      // Memilih kategori non-eksisten tidak memicu crash
      viewModel.selectSpecCategory('Tidak Ada');
      expect(viewModel.currentSpecifications, isEmpty);
    });

    test('Format nama warna dari URL gambar diekstrak secara anggun jika list colors berisi URL', () {
      const motorWithUrlColors = Motor(
        id: 'vario',
        name: 'Vario 160',
        category: MotorCategory.matic,
        price: 26000000,
        images: [
          'https://ik.imagekit.io/ahmcdn/uploads/product-draft/colors/grande-matte-black-1-2-01022023-085835.jpg',
          'https://ik.imagekit.io/ahmcdn/uploads/product-draft/colors/grande-matte-red-3-01022023-085857.jpg',
        ],
        colors: [
          'https://ik.imagekit.io/ahmcdn/uploads/product-draft/colors/grande-matte-black-1-2-01022023-085835.jpg',
          'https://ik.imagekit.io/ahmcdn/uploads/product-draft/colors/grande-matte-red-3-01022023-085857.jpg',
        ],
        specifications: {},
      );

      final viewModel = DetailViewModel(motor: motorWithUrlColors);
      expect(viewModel.currentColorName, equals('Grande Matte Black'));

      viewModel.selectVariant(1);
      expect(viewModel.currentColorName, equals('Grande Matte Red'));
    });
  });
}
