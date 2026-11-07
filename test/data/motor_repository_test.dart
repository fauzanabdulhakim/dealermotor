// Pengujian unit untuk MotorRepository dan DataSource dealermotor.
// Memastikan abstraksi data layer dan koreksi data EV Honda EM1 e: berjalan sesuai spesifikasi.

import 'package:dealermotor/data/datasources/local_motor_data_source.dart';
import 'package:dealermotor/data/repositories/motor_repository_impl.dart';
import 'package:dealermotor/domain/models/motor_category.dart';
import 'package:dealermotor/domain/repositories/motor_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MotorRepository repository;

  setUp(() {
    // Inisialisasi repositori dengan LocalMotorDataSource
    final dataSource = LocalMotorDataSource();
    repository = MotorRepositoryImpl(dataSource: dataSource);
  });

  group('MotorRepository - Pengambilan Data Dasar', () {
    test('getAllMotors mengembalikan seluruh daftar motor katalog secara lengkap', () async {
      final motors = await repository.getAllMotors();

      expect(motors, isNotEmpty);
      expect(motors.length, 26);

      // Verifikasi setiap motor memiliki atribut esensial yang valid
      for (final motor in motors) {
        expect(motor.id, isNotEmpty, reason: 'ID motor tidak boleh kosong');
        expect(motor.name, isNotEmpty, reason: 'Nama motor tidak boleh kosong');
        expect(motor.price, greaterThan(0), reason: 'Harga motor harus bilangan bulat positif');
        expect(motor.images, isNotEmpty, reason: 'Daftar gambar motor tidak boleh kosong');
        expect(motor.specifications, isNotEmpty, reason: 'Spesifikasi motor tidak boleh kosong');
        expect(motor.formattedPrice, startsWith('Rp '), reason: 'Harga terformat harus diawali Rp ');
      }

      // Pastikan semua ID unik (tidak ada duplikasi)
      final idSet = motors.map((m) => m.id).toSet();
      expect(idSet.length, motors.length, reason: 'Seluruh ID motor harus unik');
    });

    test('getPromotionalBanners mengembalikan daftar banner promo beranda', () async {
      final banners = await repository.getPromotionalBanners();

      expect(banners, isNotEmpty);
      for (final banner in banners) {
        expect(banner.id, isNotEmpty);
        expect(banner.imageUrl, startsWith('http'));
      }
    });
  });

  group('MotorRepository - Filter Kategori', () {
    test('getMotorsByCategory mengembalikan hanya motor matic untuk kategori matic', () async {
      final maticMotors = await repository.getMotorsByCategory(MotorCategory.matic);

      expect(maticMotors, isNotEmpty);
      expect(maticMotors.length, 9);
      expect(maticMotors.every((m) => m.category == MotorCategory.matic), isTrue);

      final names = maticMotors.map((m) => m.name).toList();
      expect(names, containsAll(['BeAT', 'BeAT Street', 'Genio', 'Scoopy', 'Vario 125', 'Vario 160', 'PCX 160', 'ADV 160', 'Forza']));
    });

    test('getMotorsByCategory mengembalikan hanya motor sport untuk kategori sport', () async {
      final sportMotors = await repository.getMotorsByCategory(MotorCategory.sport);

      expect(sportMotors, isNotEmpty);
      expect(sportMotors.length, 11);
      expect(sportMotors.every((m) => m.category == MotorCategory.sport), isTrue);

      final names = sportMotors.map((m) => m.name).toList();
      expect(names, containsAll(['CB150 Verza', 'Sonic 150R', 'CBR150R', 'CBR250RR', 'CRF150L']));
    });

    test('getMotorsByCategory mengembalikan hanya motor cub untuk kategori cub', () async {
      final cubMotors = await repository.getMotorsByCategory(MotorCategory.cub);

      expect(cubMotors, isNotEmpty);
      expect(cubMotors.length, 5);
      expect(cubMotors.every((m) => m.category == MotorCategory.cub), isTrue);

      final names = cubMotors.map((m) => m.name).toList();
      expect(names, containsAll(['Revo', 'Supra X 125 FI', 'GTR 150', 'Supercub C125', 'CT125']));
    });

    test('getMotorsByCategory mengembalikan motor listrik untuk kategori ev', () async {
      final evMotors = await repository.getMotorsByCategory(MotorCategory.ev);

      expect(evMotors, isNotEmpty);
      expect(evMotors.length, 1);
      expect(evMotors.first.category, MotorCategory.ev);
      expect(evMotors.first.name, 'EM1 e:');
    });
  });

  group('MotorRepository - Pencarian dan Detail ID', () {
    test('searchMotors menemukan motor berdasarkan query nama secara case-insensitive', () async {
      final results = await repository.searchMotors('beat');

      expect(results.length, 2);
      final names = results.map((m) => m.name).toList();
      expect(names, containsAll(['BeAT', 'BeAT Street']));
    });

    test('searchMotors dengan keyword kosong atau spasi mengembalikan seluruh motor', () async {
      final emptyResult = await repository.searchMotors('');
      final whitespaceResult = await repository.searchMotors('   ');
      final allMotors = await repository.getAllMotors();

      expect(emptyResult.length, allMotors.length);
      expect(whitespaceResult.length, allMotors.length);
    });

    test('searchMotors mengembalikan list kosong jika motor tidak ditemukan', () async {
      final results = await repository.searchMotors('Yamaha NMax');
      expect(results, isEmpty);
    });

    test('getMotorById mengembalikan motor yang sesuai jika ID ditemukan', () async {
      final beat = await repository.getMotorById('beat');
      expect(beat, isNotNull);
      expect(beat!.name, 'BeAT');

      final em1 = await repository.getMotorById('em1-e');
      expect(em1, isNotNull);
      expect(em1!.name, 'EM1 e:');
    });

    test('getMotorById mengembalikan null jika ID tidak ditemukan', () async {
      final unknown = await repository.getMotorById('motor-fiktif-123');
      expect(unknown, isNull);
    });
  });

  group('MotorRepository - Validasi Koreksi Data Honda EM1 e: (EV)', () {
    test('Spesifikasi Honda EM1 e: memuat data resmi motor listrik dan bebas dari data bensin', () async {
      final em1 = await repository.getMotorById('em1-e');

      expect(em1, isNotNull);
      expect(em1!.category, MotorCategory.ev);
      expect(em1.price, 45000000);

      final specs = em1.specifications;

      // 1. Verifikasi spesifikasi motor listrik & performa
      expect(specs.containsKey('Mesin') || specs.containsKey('Motor Listrik'), isTrue);
      final motorGroup = specs['Mesin'] ?? specs['Motor Listrik']!;
      final motorValues = motorGroup.values.join(' ');

      expect(motorValues, contains('In-wheel Brushless Electric Motor'));
      expect(motorValues, contains('1.7 kW / 540 rpm'));
      expect(motorValues, contains('90 Nm / 25 rpm'));

      // 2. Verifikasi spesifikasi baterai & pengisian
      final allGroupValues = specs.values.map((group) => group.values.join(' ')).join(' ');
      expect(allGroupValues, contains('Honda Mobile Power Pack e:'));
      expect(allGroupValues, contains('Lithium-ion'));
      expect(allGroupValues, contains('41.1 km'));
      expect(allGroupValues, contains('45 km/h'));
      expect(allGroupValues, contains('6 jam'));
      expect(allGroupValues, contains('2.7 jam'));

      // 3. Verifikasi ketiadaan atribut mesin bensin/konvensional
      final allKeysAndValues = specs.entries
          .map((e) => '${e.key} ${e.value.keys.join(' ')} ${e.value.values.join(' ')}')
          .join(' ')
          .toLowerCase();

      expect(allKeysAndValues.contains('tangki bahan bakar'), isFalse,
          reason: 'Motor EV tidak boleh memiliki kapasitas tangki bahan bakar');
      expect(allKeysAndValues.contains('4.2 liter'), isFalse,
          reason: 'Motor EV tidak boleh memiliki 4.2 liter bensin');
      expect(allKeysAndValues.contains('tipe busi'), isFalse,
          reason: 'Motor EV tidak boleh memiliki tipe busi');
      expect(RegExp(r'\bngk\b').hasMatch(allKeysAndValues), isFalse,
          reason: 'Motor EV tidak boleh memiliki busi NGK');
      expect(allKeysAndValues.contains('denso'), isFalse,
          reason: 'Motor EV tidak boleh memiliki busi Denso');
      expect(allKeysAndValues.contains('minyak pelumas'), isFalse,
          reason: 'Motor EV tidak boleh memiliki kapasitas oli mesin bensin');
      expect(allKeysAndValues.contains('pgm-fi'), isFalse,
          reason: 'Motor EV tidak boleh menggunakan sistem injeksi bensin PGM-FI');
      expect(allKeysAndValues.contains('sohc'), isFalse,
          reason: 'Motor EV tidak boleh memiliki arsitektur mesin SOHC');
      expect(allKeysAndValues.contains('109,5cc'), isFalse,
          reason: 'Motor EV tidak boleh memiliki volume silinder 109,5cc');
    });
  });
}
