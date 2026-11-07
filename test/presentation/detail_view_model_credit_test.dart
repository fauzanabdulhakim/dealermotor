// Pengujian unit untuk fitur Simulasi Kredit dan WhatsApp Sales pada DetailViewModel.
// Memverifikasi interaksi perubahan persentase DP, nominal DP, pergantian tenor,
// dan pemanggilan action contactSalesViaWhatsApp.

import 'package:dealermotor/domain/models/motor.dart';
import 'package:dealermotor/domain/models/motor_category.dart';
import 'package:dealermotor/presentation/viewmodels/detail_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  group('DetailViewModel Credit Simulation & WhatsApp Tests', () {
    late Motor testMotor;

    setUp(() {
      testMotor = const Motor(
        id: 'vario-160',
        name: 'Vario 160',
        category: MotorCategory.matic,
        price: 27000000,
        images: ['https://example.com/vario.jpg'],
        colors: ['Grande Matte Black'],
        specifications: {},
      );
    });

    test('Inisialisasi ViewModel menyediakan state kredit default (DP 20%, Tenor 35 Bulan)', () {
      final viewModel = DetailViewModel(motor: testMotor);

      expect(viewModel.downPaymentPercent, equals(0.20));
      expect(viewModel.selectedTenor, equals(35));
      expect(viewModel.creditSimulation.otrPrice, equals(27000000));
      expect(viewModel.creditSimulation.downPayment, equals(5400000));
      expect(viewModel.creditSimulation.tenorMonths, equals(35));
      expect(viewModel.creditSimulation.monthlyInstallment, greaterThan(0));
    });

    test('updateDownPaymentPercent memperbarui DP dan menghitung ulang simulasi', () {
      final viewModel = DetailViewModel(motor: testMotor);
      var notified = false;
      viewModel.addListener(() => notified = true);

      viewModel.updateDownPaymentPercent(0.30);

      expect(notified, isTrue);
      expect(viewModel.downPaymentPercent, equals(0.30));
      expect(viewModel.creditSimulation.downPayment, equals(8100000));
      expect(viewModel.creditSimulation.principalAmount, equals(18900000));

      // Jika memasukkan DP di bawah 20%, disesuaikan ke batas minimal 20%
      viewModel.updateDownPaymentPercent(0.05);
      expect(viewModel.downPaymentPercent, equals(0.20));
      expect(viewModel.creditSimulation.downPayment, equals(5400000));
    });

    test('updateDownPaymentAmount memperbarui persentase DP dari nilai nominal Rupiah', () {
      final viewModel = DetailViewModel(motor: testMotor);
      var notified = false;
      viewModel.addListener(() => notified = true);

      // 40% dari 27.000.000 = 10.800.000
      viewModel.updateDownPaymentAmount(10800000);

      expect(notified, isTrue);
      expect(viewModel.downPaymentPercent, closeTo(0.40, 0.001));
      expect(viewModel.creditSimulation.downPayment, equals(10800000));
    });

    test('selectTenor memperbarui tenor terpilih dan memicu kalkulasi ulang', () {
      final viewModel = DetailViewModel(motor: testMotor);
      var notified = false;
      viewModel.addListener(() => notified = true);

      viewModel.selectTenor(11);

      expect(notified, isTrue);
      expect(viewModel.selectedTenor, equals(11));
      expect(viewModel.creditSimulation.tenorMonths, equals(11));

      // Memilih tenor yang sama tidak perlu memicu notifikasi berlebih
      notified = false;
      viewModel.selectTenor(11);
      expect(notified, isFalse);
    });

    test('contactSalesViaWhatsApp memanggil peluncur URL dengan tautan wa.me dan pesan terformat', () async {
      Uri? launchedUri;
      LaunchMode? launchedMode;

      final viewModel = DetailViewModel(
        motor: testMotor,
        urlLauncher: (uri, {mode = LaunchMode.platformDefault}) async {
          launchedUri = uri;
          launchedMode = mode;
          return true;
        },
      );

      final success = await viewModel.contactSalesViaWhatsApp(phoneNumber: '6281234567890');

      expect(success, isTrue);
      expect(launchedUri, isNotNull);
      expect(launchedUri!.scheme, equals('https'));
      expect(launchedUri!.host, equals('wa.me'));
      expect(launchedUri!.path, equals('/6281234567890'));
      expect(launchedMode, equals(LaunchMode.externalApplication));

      // Query param teks harus memuat data motor dan simulasi
      final textQuery = launchedUri!.queryParameters['text'];
      expect(textQuery, isNotNull);
      expect(textQuery, contains('Vario 160'));
      expect(textQuery, contains('Grande Matte Black'));
      expect(textQuery, contains('Rp 27.000.000'));
      expect(textQuery, contains('35 Bulan'));
    });
  });
}
