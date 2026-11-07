// Pengujian widget untuk MotorGridWidget.
// Memverifikasi perhitungan kolom responsif berdasarkan lebar layar dan tampilan empty state.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dealermotor/domain/models/motor.dart';
import 'package:dealermotor/domain/models/motor_category.dart';
import 'package:dealermotor/presentation/widgets/motor_grid_widget.dart';

void main() {
  final dummyMotors = [
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
  ];

  Widget createWidgetUnderTest({
    List<Motor> motors = const [],
    double width = 400,
    void Function(Motor)? onMotorTap,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: width,
            height: 800,
            child: MotorGridWidget(
              motors: motors,
              onMotorTap: onMotorTap,
            ),
          ),
        ),
      ),
    );
  }

  group('MotorGridWidget Tests', () {
    testWidgets('Menampilkan empty state jika daftar motor kosong', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(motors: []));

      expect(find.text('Motor tidak ditemukan'), findsOneWidget);
      expect(find.byIcon(Icons.search_off_rounded), findsOneWidget);
    });

    testWidgets('Menampilkan GridView dengan 2 kolom pada layar mobile (< 600 dp)', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(motors: dummyMotors, width: 400));

      final gridViewFinder = find.byType(GridView);
      expect(gridViewFinder, findsOneWidget);

      final GridView gridView = tester.widget(gridViewFinder);
      final delegate = gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      expect(delegate.crossAxisCount, equals(2));
      expect(delegate.childAspectRatio, equals(0.72));
    });

    testWidgets('Menampilkan GridView dengan 3 atau 4 kolom pada layar tablet (600 - 1024 dp)', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(motors: dummyMotors, width: 700));

      final gridViewFinder = find.byType(GridView);
      expect(gridViewFinder, findsOneWidget);

      final GridView gridView = tester.widget(gridViewFinder);
      final delegate = gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      expect(delegate.crossAxisCount, equals(3));
    });

    testWidgets('Menampilkan GridView terpusat dengan batasan maxWidth pada desktop (> 1024 dp)', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(motors: dummyMotors, width: 1280));

      final constrainedBoxFinder = find.byType(ConstrainedBox);
      expect(constrainedBoxFinder, findsWidgets);

      final gridViewFinder = find.byType(GridView);
      expect(gridViewFinder, findsOneWidget);

      final GridView gridView = tester.widget(gridViewFinder);
      final delegate = gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      expect(delegate.crossAxisCount, equals(4));
    });

    testWidgets('Menjalankan onMotorTap saat motor di-tap', (WidgetTester tester) async {
      Motor? tappedMotor;
      await tester.pumpWidget(
        createWidgetUnderTest(
          motors: dummyMotors,
          width: 400,
          onMotorTap: (motor) {
            tappedMotor = motor;
          },
        ),
      );

      await tester.tap(find.text('BeAT'));
      await tester.pump();

      expect(tappedMotor, isNotNull);
      expect(tappedMotor?.id, equals('beat'));
    });
  });
}
