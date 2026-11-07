// Pengujian widget untuk CreditSimulationWidget.
// Memverifikasi rendering elemen kalkulator kredit (slider DP, opsi tenor, kartu estimasi angsuran),
// interaksi pembaruan tenor dan slider, serta pemanggilan tombol CTA WhatsApp.

import 'package:dealermotor/domain/models/motor.dart';
import 'package:dealermotor/domain/models/motor_category.dart';
import 'package:dealermotor/presentation/viewmodels/detail_view_model.dart';
import 'package:dealermotor/presentation/widgets/credit_simulation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  group('CreditSimulationWidget Tests', () {
    late Motor testMotor;
    late DetailViewModel testViewModel;
    bool whatsAppLaunched = false;

    setUp(() {
      whatsAppLaunched = false;
      testMotor = const Motor(
        id: 'beat-cbs',
        name: 'BeAT CBS',
        category: MotorCategory.matic,
        price: 18000000,
        images: ['https://example.com/beat.jpg'],
        colors: ['Hard Rock Black'],
        specifications: {},
      );

      testViewModel = DetailViewModel(
        motor: testMotor,
        urlLauncher: (uri, {mode = LaunchMode.platformDefault}) async {
          whatsAppLaunched = true;
          return true;
        },
      );
    });

    Widget buildTestableWidget(DetailViewModel vm) {
      return MaterialApp(
        home: Scaffold(
          body: ChangeNotifierProvider<DetailViewModel>.value(
            value: vm,
            child: const SingleChildScrollView(
              child: CreditSimulationWidget(),
            ),
          ),
        ),
      );
    }

    testWidgets('Merender seluruh elemen utama simulasi kredit dan tombol WhatsApp', (tester) async {
      await tester.pumpWidget(buildTestableWidget(testViewModel));
      await tester.pumpAndSettle();

      // Judul tanpa ikon kalkulator
      expect(find.text('Simulasi Kredit & Angsuran'), findsOneWidget);
      expect(find.byIcon(Icons.calculate_outlined), findsNothing);

      // Label Uang Muka (DP)
      expect(find.textContaining('Uang Muka (DP)'), findsOneWidget);
      expect(find.text('20%'), findsOneWidget);
      expect(find.text('Rp 3.600.000'), findsOneWidget);

      // Slider DP
      expect(find.byType(Slider), findsOneWidget);

      // Opsi Pilihan Tenor
      expect(find.text('11 Bulan'), findsOneWidget);
      expect(find.text('23 Bulan'), findsOneWidget);
      expect(find.text('29 Bulan'), findsOneWidget);
      expect(find.text('35 Bulan'), findsOneWidget);

      // Kartu Estimasi Angsuran
      expect(find.text('Estimasi Angsuran'), findsOneWidget);
      expect(find.textContaining('/ bulan'), findsOneWidget);

      // Tombol CTA WhatsApp tanpa ikon
      expect(find.text('Konsultasi Sales via WhatsApp'), findsOneWidget);
      expect(find.byIcon(Icons.chat_outlined), findsNothing);
    });

    testWidgets('Interaksi pergantian tenor memperbarui nilai angsuran pada kartu ringkasan', (tester) async {
      await tester.pumpWidget(buildTestableWidget(testViewModel));
      await tester.pumpAndSettle();

      // Dapatkan nilai angsuran awal untuk tenor 35
      final initialInstallmentText = testViewModel.creditSimulation.formattedMonthlyInstallment;
      expect(find.textContaining(initialInstallmentText), findsOneWidget);

      // Tap pilihan tenor 11 Bulan
      final tenor11Chip = find.text('11 Bulan');
      expect(tenor11Chip, findsOneWidget);
      await tester.tap(tenor11Chip);
      await tester.pumpAndSettle();

      // Verifikasi ViewModel telah diperbarui ke tenor 11
      expect(testViewModel.selectedTenor, equals(11));

      // Verifikasi teks estimasi angsuran di layar berubah ke nominal tenor 11
      final newInstallmentText = testViewModel.creditSimulation.formattedMonthlyInstallment;
      expect(find.textContaining(newInstallmentText), findsOneWidget);
      expect(newInstallmentText, isNot(equals(initialInstallmentText)));
    });

    testWidgets('Interaksi penggeseran slider DP memperbarui persentase dan nominal DP', (tester) async {
      await tester.pumpWidget(buildTestableWidget(testViewModel));
      await tester.pumpAndSettle();

      final sliderFinder = find.byType(Slider);
      expect(sliderFinder, findsOneWidget);

      // Geser slider ke arah kanan
      await tester.drag(sliderFinder, const Offset(150, 0));
      await tester.pumpAndSettle();

      // Verifikasi persentase DP meningkat dari nilai awal 20%
      expect(testViewModel.downPaymentPercent, greaterThan(0.20));
      expect(testViewModel.creditSimulation.downPayment, greaterThan(3600000));
    });

    testWidgets('Menekan tombol WhatsApp memanggil aksi kontak sales pada ViewModel', (tester) async {
      await tester.pumpWidget(buildTestableWidget(testViewModel));
      await tester.pumpAndSettle();

      final whatsAppButton = find.text('Konsultasi Sales via WhatsApp');
      expect(whatsAppButton, findsOneWidget);

      await tester.tap(whatsAppButton);
      await tester.pumpAndSettle();

      expect(whatsAppLaunched, isTrue);
    });
  });
}
