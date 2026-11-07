// Layanan domain untuk kalkulasi simulasi kredit leasing sepeda motor
// dan pembuatan draf pesan WhatsApp konsultasi sales.
// Mematuhi aturan Clean Architecture tanpa dependensi ke layer UI.

import '../models/credit_simulation.dart';
import '../models/motor.dart';

/// Service yang bertanggung jawab atas logika bisnis kalkulasi kredit dan integrasi pesan sales.
class CreditCalculatorService {
  /// Batas minimal uang muka (DP) sesuai regulasi pembiayaan kendaraan bermotor (20%).
  static const double minimumDownPaymentPercent = 0.20;

  /// Batas maksimal uang muka (DP) pada simulasi slider (70%).
  static const double maximumDownPaymentPercent = 0.70;

  /// Suku bunga flat tahunan default untuk simulasi kredit motor (8% per tahun).
  static const double defaultAnnualInterestRate = 0.08;

  /// Daftar pilihan tenor standar pembiayaan leasing motor (dalam satuan bulan).
  static const List<int> standardTenorMonths = [11, 23, 29, 35];

  const CreditCalculatorService();

  /// Menghitung rincian simulasi kredit berdasarkan persentase uang muka [downPaymentPercent].
  ///
  /// Jika [downPaymentPercent] bernilai kurang dari [minimumDownPaymentPercent] (20%),
  /// maka otomatis disesuaikan ke batas minimum 20%.
  CreditSimulation calculate({
    required int otrPrice,
    required double downPaymentPercent,
    required int tenorMonths,
    double annualInterestRate = defaultAnnualInterestRate,
  }) {
    // Validasi dan normalisasi batas minimum DP (20%)
    final effectiveDpPercent = downPaymentPercent < minimumDownPaymentPercent
        ? minimumDownPaymentPercent
        : downPaymentPercent;

    final downPayment = (otrPrice * effectiveDpPercent).round();
    final principal = otrPrice - downPayment;

    // Perhitungan total bunga: principal * (annualInterestRate * (tenorMonths / 12))
    final totalInterest = (principal * (annualInterestRate * (tenorMonths / 12.0))).round();
    final totalLoan = principal + totalInterest;

    // Estimasi cicilan bulanan dibulatkan ke bilangan bulat terdekat
    final monthlyInstallment = tenorMonths > 0 ? (totalLoan / tenorMonths).round() : 0;

    return CreditSimulation(
      otrPrice: otrPrice,
      downPayment: downPayment,
      downPaymentPercent: effectiveDpPercent,
      tenorMonths: tenorMonths,
      annualInterestRate: annualInterestRate,
      principalAmount: principal,
      totalInterest: totalInterest,
      totalLoan: totalLoan,
      monthlyInstallment: monthlyInstallment,
    );
  }

  /// Menghitung simulasi kredit berdasarkan nominal uang muka [downPaymentAmount] dalam Rupiah.
  CreditSimulation calculateWithAmount({
    required int otrPrice,
    required int downPaymentAmount,
    required int tenorMonths,
    double annualInterestRate = defaultAnnualInterestRate,
  }) {
    if (otrPrice <= 0) {
      return calculate(
        otrPrice: otrPrice,
        downPaymentPercent: minimumDownPaymentPercent,
        tenorMonths: tenorMonths,
        annualInterestRate: annualInterestRate,
      );
    }

    final calculatedPercent = downPaymentAmount / otrPrice;
    return calculate(
      otrPrice: otrPrice,
      downPaymentPercent: calculatedPercent,
      tenorMonths: tenorMonths,
      annualInterestRate: annualInterestRate,
    );
  }

  /// Menyusun template draf pesan WhatsApp konsultasi sales dalam Bahasa Indonesia yang ramah dan profesional.
  String generateWhatsAppMessage({
    required Motor motor,
    required String variantColor,
    required CreditSimulation simulation,
    String? dealerPhone,
  }) {
    final buffer = StringBuffer();
    buffer.writeln('Halo Sales Dealer Motor Honda,');
    buffer.writeln('Saya ingin konsultasi mengenai pengajuan kredit sepeda motor berikut:');
    buffer.writeln('');
    buffer.writeln('📋 *Rincian Motor & Simulasi Kredit:*');
    buffer.writeln('• Model: *${motor.name}*');
    buffer.writeln('• Varian Warna: $variantColor');
    buffer.writeln('• Harga OTR: ${motor.formattedPrice}');
    buffer.writeln('• Uang Muka (DP): ${simulation.formattedDownPayment} (${simulation.downPaymentPercentLabel})');
    buffer.writeln('• Pilihan Tenor: ${simulation.tenorMonths} Bulan');
    buffer.writeln('• Estimasi Angsuran: *${simulation.formattedMonthlyInstallment} / bulan*');
    buffer.writeln('');
    buffer.writeln('Mohon informasi ketersediaan unit dan persyaratan dokumen yang dibutuhkan. Terima kasih!');

    return buffer.toString();
  }
}
