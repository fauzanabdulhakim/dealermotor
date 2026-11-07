// Pengujian unit untuk CreditCalculatorService dan model CreditSimulation.
// Menguji perhitungan pokok, bunga flat, total pinjaman, angsuran per tenor,
// batas minimum uang muka (DP 20%), dan pembuatan draf pesan konsultasi WhatsApp.

import 'package:dealermotor/domain/models/motor.dart';
import 'package:dealermotor/domain/models/motor_category.dart';
import 'package:dealermotor/domain/services/credit_calculator_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CreditCalculatorService Tests', () {
    late CreditCalculatorService service;
    late Motor testMotor;

    setUp(() {
      service = const CreditCalculatorService();
      testMotor = const Motor(
        id: 'beat-deluxe',
        name: 'BeAT Deluxe',
        category: MotorCategory.matic,
        price: 20000000,
        images: ['https://example.com/beat.jpg'],
        colors: ['Deluxe Black'],
        specifications: {},
      );
    });

    test('Menghitung simulasi kredit tenor 11 bulan dengan benar', () {
      final simulation = service.calculate(
        otrPrice: 20000000,
        downPaymentPercent: 0.20,
        tenorMonths: 11,
      );

      expect(simulation.otrPrice, equals(20000000));
      expect(simulation.downPayment, equals(4000000));
      expect(simulation.downPaymentPercent, equals(0.20));
      expect(simulation.principalAmount, equals(16000000));
      expect(simulation.tenorMonths, equals(11));
      expect(simulation.annualInterestRate, equals(0.08));
      expect(simulation.totalInterest, equals(1173333));
      expect(simulation.totalLoan, equals(17173333));
      expect(simulation.monthlyInstallment, equals(1561212));
      expect(simulation.formattedMonthlyInstallment, equals('Rp 1.561.212'));
      expect(simulation.formattedDownPayment, equals('Rp 4.000.000'));
    });

    test('Menghitung simulasi kredit tenor 23 bulan dengan benar', () {
      final simulation = service.calculate(
        otrPrice: 20000000,
        downPaymentPercent: 0.20,
        tenorMonths: 23,
      );

      expect(simulation.principalAmount, equals(16000000));
      expect(simulation.tenorMonths, equals(23));
      expect(simulation.totalInterest, equals(2453333));
      expect(simulation.totalLoan, equals(18453333));
      expect(simulation.monthlyInstallment, equals(802319));
      expect(simulation.formattedMonthlyInstallment, equals('Rp 802.319'));
    });

    test('Menghitung simulasi kredit tenor 29 bulan dengan benar', () {
      final simulation = service.calculate(
        otrPrice: 20000000,
        downPaymentPercent: 0.20,
        tenorMonths: 29,
      );

      expect(simulation.principalAmount, equals(16000000));
      expect(simulation.tenorMonths, equals(29));
      expect(simulation.totalInterest, equals(3093333));
      expect(simulation.totalLoan, equals(19093333));
      expect(simulation.monthlyInstallment, equals(658391));
      expect(simulation.formattedMonthlyInstallment, equals('Rp 658.391'));
    });

    test('Menghitung simulasi kredit tenor 35 bulan dengan benar', () {
      final simulation = service.calculate(
        otrPrice: 20000000,
        downPaymentPercent: 0.20,
        tenorMonths: 35,
      );

      expect(simulation.principalAmount, equals(16000000));
      expect(simulation.tenorMonths, equals(35));
      expect(simulation.totalInterest, equals(3733333));
      expect(simulation.totalLoan, equals(19733333));
      expect(simulation.monthlyInstallment, equals(563810));
      expect(simulation.formattedMonthlyInstallment, equals('Rp 563.810'));
    });

    test('Batas minimum DP adalah 20% dari OTR, jika di bawah 20% otomatis dikoreksi ke 20%', () {
      // Input persentase DP 10% (di bawah batas minimum 20%)
      final simulationFromPercent = service.calculate(
        otrPrice: 20000000,
        downPaymentPercent: 0.10,
        tenorMonths: 35,
      );

      expect(simulationFromPercent.downPaymentPercent, equals(0.20));
      expect(simulationFromPercent.downPayment, equals(4000000));
      expect(simulationFromPercent.principalAmount, equals(16000000));

      // Input nominal DP 2.000.000 (10% dari 20.000.000)
      final simulationFromAmount = service.calculateWithAmount(
        otrPrice: 20000000,
        downPaymentAmount: 2000000,
        tenorMonths: 35,
      );

      expect(simulationFromAmount.downPaymentPercent, equals(0.20));
      expect(simulationFromAmount.downPayment, equals(4000000));
      expect(simulationFromAmount.principalAmount, equals(16000000));
    });

    test('Mendukung custom down payment yang lebih tinggi dari 20%', () {
      final simulation = service.calculate(
        otrPrice: 20000000,
        downPaymentPercent: 0.40,
        tenorMonths: 35,
      );

      expect(simulation.downPaymentPercent, equals(0.40));
      expect(simulation.downPayment, equals(8000000));
      expect(simulation.principalAmount, equals(12000000));
      // Bunga 12.000.000 * 0.08 * 35 / 12 = 2.800.000
      expect(simulation.totalInterest, equals(2800000));
      expect(simulation.totalLoan, equals(14800000));
      // Angsuran: 14.800.000 / 35 = 422.857
      expect(simulation.monthlyInstallment, equals(422857));
    });

    test('generateWhatsAppMessage menyusun teks konsultasi lengkap dan rapi dalam Bahasa Indonesia', () {
      final simulation = service.calculate(
        otrPrice: testMotor.price,
        downPaymentPercent: 0.20,
        tenorMonths: 35,
      );

      final message = service.generateWhatsAppMessage(
        motor: testMotor,
        variantColor: 'Deluxe Black',
        simulation: simulation,
      );

      expect(message, contains('Halo Sales'));
      expect(message, contains('BeAT Deluxe'));
      expect(message, contains('Deluxe Black'));
      expect(message, contains(testMotor.formattedPrice));
      expect(message, contains(simulation.formattedDownPayment));
      expect(message, contains('35 Bulan'));
      expect(message, contains(simulation.formattedMonthlyInstallment));
    });
  });
}
