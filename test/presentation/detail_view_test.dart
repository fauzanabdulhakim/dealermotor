// Pengujian widget untuk DetailView.
// Memverifikasi rendering elemen kunci, interaksi varian warna,
// bebas dari crash Hero tag, serta tata letak responsif pada mobile dan tablet.

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dealermotor/detailpage.dart';
import 'package:dealermotor/domain/models/motor.dart';
import 'package:dealermotor/domain/models/motor_category.dart';
import 'package:dealermotor/model/motordata.dart';
import 'package:dealermotor/presentation/widgets/credit_simulation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Motor dummyMotor;

  setUp(() {
    dummyMotor = const Motor(
      id: 'cbr250rr',
      name: 'CBR250RR',
      category: MotorCategory.sport,
      price: 63000000,
      description: 'Motor sport premium Honda bertenaga tinggi.',
      images: [
        'https://example.com/cbr-red.jpg',
        'https://example.com/cbr-black.jpg',
      ],
      colors: [
        'Racing Red',
        'Matte Gunpowder Black',
      ],
      specifications: {
        'Mesin': {
          'Tipe Mesin': '4-Stroke, 8-Valve, Parallel Twin Cylinder',
          'Kapasitas Mesin': '249.7 cc',
          'Daya Maksimum': '30 kW (41 PS) / 13.000 rpm',
        },
        'Rangka': {
          'Tipe Rangka': 'Truss Frame',
          'Rem Depan': 'Hydraulic Disc, Dual Piston',
        },
      },
    );
  });

  Widget buildDetailWidget({required Motor motor, Size screenSize = const Size(400, 800)}) {
    return MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(size: screenSize),
        child: DetailView(motor: motor),
      ),
    );
  }

  group('DetailView Widget Tests', () {
    testWidgets('Merender elemen utama: nama motor, harga terformat, dan tabel spesifikasi tanpa badge kategori', (tester) async {
      await tester.pumpWidget(buildDetailWidget(motor: dummyMotor));
      await tester.pump(const Duration(milliseconds: 300));

      // Verifikasi nama motor
      expect(find.text('CBR250RR'), findsWidgets);

      // Verifikasi harga OTR terformat
      expect(find.text(dummyMotor.formattedPrice), findsOneWidget);

      // Verifikasi badge kategori telah dihilangkan dari halaman detail
      expect(find.text(dummyMotor.category.displayName), findsNothing);

      // Verifikasi kategori spesifikasi 'Mesin' aktif dan menampilkan fitur
      expect(find.text('Tipe Mesin'), findsOneWidget);
      expect(find.text('4-Stroke, 8-Valve, Parallel Twin Cylinder'), findsOneWidget);
    });

    testWidgets('Merender carousel gambar varian tanpa card/tab dan teks varian dihilangkan', (tester) async {
      await tester.pumpWidget(buildDetailWidget(motor: dummyMotor));
      await tester.pump(const Duration(milliseconds: 300));

      // Verifikasi carousel slider tampil untuk gambar varian
      expect(find.byType(CarouselSlider), findsOneWidget);

      // Verifikasi teks 'Warna:' dan chip 'Varian' telah dihilangkan
      expect(find.textContaining('Warna:'), findsNothing);
      expect(find.byKey(const ValueKey('variant_chip_0')), findsNothing);
    });

    testWidgets('Verifikasi tidak terjadi error duplikasi tag Hero pada subtree', (tester) async {
      // Menampilkan halaman detail tidak boleh melempar runtime exception Hero
      await tester.pumpWidget(buildDetailWidget(motor: dummyMotor));
      await tester.pump(const Duration(milliseconds: 300));

      // Cari semua Hero widget pada tree
      final heroWidgets = tester.widgetList<Hero>(find.byType(Hero));

      // Kumpulkan tag hero
      final tags = heroWidgets.map((h) => h.tag).toList();

      // Tag hero tidak boleh ada yang duplikat
      final uniqueTags = tags.toSet();
      expect(tags.length, equals(uniqueTags.length),
          reason: 'Setiap Hero widget di dalam subtree wajib memiliki tag yang unik');

      // Tag hero varian pertama harus sesuai konvensi 'hero_motor_${motor.id}_0'
      expect(tags.contains('hero_motor_${dummyMotor.id}_0'), isTrue);
    });

    testWidgets('Responsivitas: Merender tata letak mobile (< 600 dp) secara vertikal proporsional', (tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(buildDetailWidget(motor: dummyMotor, screenSize: const Size(400, 800)));
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(DetailView), findsOneWidget);
      expect(find.text('CBR250RR'), findsWidgets);
      expect(find.text(dummyMotor.formattedPrice), findsOneWidget);
      expect(find.byType(CreditSimulationWidget), findsOneWidget);
    });

    testWidgets('Responsivitas: Merender tata letak layar lebar/tablet (>= 600 dp) dalam split-view', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(buildDetailWidget(motor: dummyMotor, screenSize: const Size(1024, 768)));
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(DetailView), findsOneWidget);
      expect(find.text('CBR250RR'), findsWidgets);
      expect(find.text(dummyMotor.formattedPrice), findsOneWidget);
      expect(find.byType(CreditSimulationWidget), findsOneWidget);
    });

    testWidgets('Pergantian tab/kategori spesifikasi menampilkan data fitur kategori yang dipilih', (tester) async {
      await tester.pumpWidget(buildDetailWidget(motor: dummyMotor));
      await tester.pump(const Duration(milliseconds: 300));

      // Pilih kategori spesifikasi 'Rangka'
      final rangkaChip = find.byKey(const ValueKey('spec_cat_Rangka'));
      expect(rangkaChip, findsOneWidget);

      await tester.tap(rangkaChip);
      await tester.pump(const Duration(milliseconds: 300));

      // Verifikasi konten spesifikasi Rangka muncul
      expect(find.text('Tipe Rangka'), findsOneWidget);
      expect(find.text('Truss Frame'), findsOneWidget);
    });

    testWidgets('MotorDetailPage dapat menerima model legacy MotorData dan mendelegasikan ke DetailView dengan benar', (tester) async {
      final legacyMotor = MotorData(
        name: 'BeAT CBS',
        price: 'Rp 18.050.000',
        imageUrls: ['https://example.com/beat.jpg'],
        specifications: {
          'Mesin': [
            {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC'},
          ],
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          home: MotorDetailPage(motor: legacyMotor),
        ),
      );
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(DetailView), findsOneWidget);
      expect(find.text('BeAT CBS'), findsWidgets);
      expect(find.text('Rp 18.050.000'), findsOneWidget);
      expect(find.text('Tipe Mesin'), findsOneWidget);
      expect(find.text('4 - Langkah, SOHC'), findsOneWidget);
    });
  });
}
