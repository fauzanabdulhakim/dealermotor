// Pengujian widget untuk MotorCard.
// Memverifikasi tampilan nama motor, badge kategori, harga terformat Rupiah,
// konfigurasi tag Hero, serta aksi interaksi tap.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dealermotor/domain/models/motor.dart';
import 'package:dealermotor/domain/models/motor_category.dart';
import 'package:dealermotor/presentation/widgets/motor_card.dart';

void main() {
  const dummyMotor = Motor(
    id: 'beat',
    name: 'BeAT',
    category: MotorCategory.matic,
    price: 18050000,
    images: ['https://example.com/beat.png'],
    specifications: {},
  );

  Widget createWidgetUnderTest({
    Motor motor = dummyMotor,
    VoidCallback? onTap,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 250,
            height: 350,
            child: MotorCard(
              motor: motor,
              onTap: onTap,
            ),
          ),
        ),
      ),
    );
  }

  group('MotorCard Widget Tests', () {
    testWidgets('Menampilkan nama motor dan harga terformat Rupiah tanpa badge kategori', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Verifikasi nama motor muncul
      expect(find.text('BeAT'), findsOneWidget);

      // Verifikasi badge kategori telah dihilangkan
      expect(find.text('Matic'), findsNothing);

      // Verifikasi harga terformat Rupiah muncul
      expect(find.text('Rp 18.050.000'), findsOneWidget);
    });

    testWidgets('Memiliki Hero widget dengan tag yang sesuai aturan hero_motor_{id}_0', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final heroFinder = find.byType(Hero);
      expect(heroFinder, findsOneWidget);

      final Hero heroWidget = tester.widget(heroFinder);
      expect(heroWidget.tag, equals('hero_motor_beat_0'));
    });

    testWidgets('Menjalankan callback onTap saat kartu motor ditekan oleh pengguna', (WidgetTester tester) async {
      bool wasTapped = false;

      await tester.pumpWidget(
        createWidgetUnderTest(
          onTap: () {
            wasTapped = true;
          },
        ),
      );

      // Lakukan tap pada kartu
      await tester.tap(find.byType(MotorCard));
      await tester.pump();

      expect(wasTapped, isTrue);
    });
  });
}
