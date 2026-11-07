// Pengujian unit untuk entitas domain Motor dan MotorCategory.

import 'package:dealermotor/domain/models/banner_promo.dart';
import 'package:dealermotor/domain/models/motor.dart';
import 'package:dealermotor/domain/models/motor_category.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MotorCategory Enum & Helper', () {
    test('displayName mengembalikan nama tampilan yang sesuai', () {
      expect(MotorCategory.matic.displayName, 'Matic');
      expect(MotorCategory.sport.displayName, 'Sport');
      expect(MotorCategory.cub.displayName, 'Cub');
      expect(MotorCategory.ev.displayName, 'EV');
    });

    test('description mengembalikan deskripsi yang tidak kosong', () {
      for (final category in MotorCategory.values) {
        expect(category.description, isNotEmpty);
      }
    });

    test('fromString mem-parsing string dengan benar secara case-insensitive', () {
      expect(MotorCategory.fromString('MATIC'), MotorCategory.matic);
      expect(MotorCategory.fromString('sport'), MotorCategory.sport);
      expect(MotorCategory.fromString('cub'), MotorCategory.cub);
      expect(MotorCategory.fromString('bebek'), MotorCategory.cub);
      expect(MotorCategory.fromString('ev'), MotorCategory.ev);
      expect(MotorCategory.fromString('electric'), MotorCategory.ev);
      expect(MotorCategory.fromString('listrik'), MotorCategory.ev);
    });

    test('fromString melempar ArgumentError jika input tidak dikenal', () {
      expect(() => MotorCategory.fromString('chopper'), throwsArgumentError);
    });

    test('tryFromString mengembalikan null jika input invalid atau null', () {
      expect(MotorCategory.tryFromString(null), isNull);
      expect(MotorCategory.tryFromString(''), isNull);
      expect(MotorCategory.tryFromString('invalid-category'), isNull);
      expect(MotorCategory.tryFromString('matic'), MotorCategory.matic);
    });
  });

  group('Motor Entity', () {
    const sampleMotor = Motor(
      id: 'beat-deluxe',
      name: 'BeAT Deluxe',
      category: MotorCategory.matic,
      price: 18900000,
      description: 'Motor matic irit dan gesit.',
      images: ['https://example.com/beat1.png', 'https://example.com/beat2.png'],
      colors: ['Black', 'Green'],
      specifications: {
        'Mesin': {
          'Tipe Mesin': '4-Langkah SOHC',
          'Kapasitas': '110 cc',
        },
      },
    );

    test('formattedPrice mengembalikan harga dalam format mata uang Rupiah', () {
      expect(sampleMotor.formattedPrice, 'Rp 18.900.000');
    });

    test('primaryImage mengembalikan gambar pertama atau string kosong', () {
      expect(sampleMotor.primaryImage, 'https://example.com/beat1.png');

      const motorWithoutImages = Motor(
        id: 'no-img',
        name: 'No Image Motor',
        category: MotorCategory.sport,
        price: 25000000,
        images: [],
        specifications: {},
      );
      expect(motorWithoutImages.primaryImage, '');
    });

    test('getSpecificationList mengonversi map ke list format row', () {
      final mesinSpecs = sampleMotor.getSpecificationList('Mesin');
      expect(mesinSpecs.length, 2);
      expect(mesinSpecs[0], {'Fitur': 'Tipe Mesin', 'Detail': '4-Langkah SOHC'});
      expect(mesinSpecs[1], {'Fitur': 'Kapasitas', 'Detail': '110 cc'});

      final emptySpecs = sampleMotor.getSpecificationList('TidakAda');
      expect(emptySpecs, isEmpty);
    });

    test('copyWith memperbarui field yang diberikan dan mempertahankan yang lain', () {
      final updated = sampleMotor.copyWith(
        price: 19500000,
        name: 'BeAT Deluxe 2026',
      );

      expect(updated.id, sampleMotor.id);
      expect(updated.price, 19500000);
      expect(updated.name, 'BeAT Deluxe 2026');
      expect(updated.category, sampleMotor.category);
    });

    test('equality dan hashCode bekerja dengan benar', () {
      final copy = sampleMotor.copyWith();
      expect(sampleMotor == copy, isTrue);
      expect(sampleMotor.hashCode, copy.hashCode);
    });
  });

  group('BannerPromo Entity', () {
    const banner = BannerPromo(
      id: 'promo-1',
      imageUrl: 'https://example.com/banner.jpg',
      title: 'Diskon Akhir Tahun',
      subtitle: 'DP Mulai 500rb',
      targetUrl: 'https://dealermotor.id/promo',
    );

    test('memiliki atribut yang sesuai dan mendukung copyWith', () {
      expect(banner.id, 'promo-1');
      expect(banner.title, 'Diskon Akhir Tahun');

      final updated = banner.copyWith(title: 'Diskon Awal Tahun');
      expect(updated.title, 'Diskon Awal Tahun');
      expect(updated.imageUrl, banner.imageUrl);
      expect(updated == banner, isFalse);
    });
  });
}
