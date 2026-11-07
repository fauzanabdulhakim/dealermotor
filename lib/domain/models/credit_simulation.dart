// Entitas domain murni untuk hasil perhitungan simulasi kredit sepeda motor.
// Bebas dari dependensi tampilan framework UI, merepresentasikan entitas bisnis finansial leasing.

import 'package:flutter/foundation.dart';
import '../../core/utils/currency_formatter.dart';

/// Entitas domain yang merepresentasikan rincian kalkulasi simulasi kredit sepeda motor.
@immutable
class CreditSimulation {
  /// Harga On The Road (OTR) sepeda motor dalam satuan Rupiah.
  final int otrPrice;

  /// Nominal uang muka (Down Payment / DP) yang dibayarkan dalam satuan Rupiah.
  final int downPayment;

  /// Persentase uang muka terhadap harga OTR (contoh: 0.20 untuk 20%).
  final double downPaymentPercent;

  /// Jangka waktu pembiayaan kredit dalam satuan bulan (contoh: 11, 23, 29, 35).
  final int tenorMonths;

  /// Suku bunga tahunan (annual interest rate) dalam format desimal (contoh: 0.08 untuk 8%).
  final double annualInterestRate;

  /// Pokok pembiayaan kredit yang diajukan (harga OTR dikurangi uang muka DP).
  final int principalAmount;

  /// Total beban bunga pinjaman selama masa tenor pembiayaan.
  final int totalInterest;

  /// Total seluruh pinjaman yang harus dilunasi (pokok pinjaman + total bunga).
  final int totalLoan;

  /// Estimasi cicilan atau angsuran yang harus dibayarkan setiap bulannya.
  final int monthlyInstallment;

  const CreditSimulation({
    required this.otrPrice,
    required this.downPayment,
    required this.downPaymentPercent,
    required this.tenorMonths,
    required this.annualInterestRate,
    required this.principalAmount,
    required this.totalInterest,
    required this.totalLoan,
    required this.monthlyInstallment,
  });

  /// Mengembalikan harga OTR dalam format Rupiah terformat (contoh: "Rp 18.050.000").
  String get formattedOtrPrice => CurrencyFormatter.formatRupiah(otrPrice);

  /// Mengembalikan nominal uang muka DP dalam format Rupiah terformat.
  String get formattedDownPayment => CurrencyFormatter.formatRupiah(downPayment);

  /// Mengembalikan pokok pinjaman dalam format Rupiah terformat.
  String get formattedPrincipalAmount => CurrencyFormatter.formatRupiah(principalAmount);

  /// Mengembalikan total bunga dalam format Rupiah terformat.
  String get formattedTotalInterest => CurrencyFormatter.formatRupiah(totalInterest);

  /// Mengembalikan total pinjaman dalam format Rupiah terformat.
  String get formattedTotalLoan => CurrencyFormatter.formatRupiah(totalLoan);

  /// Mengembalikan estimasi angsuran bulanan dalam format Rupiah terformat.
  String get formattedMonthlyInstallment => CurrencyFormatter.formatRupiah(monthlyInstallment);

  /// Mengembalikan label persentase uang muka (contoh: "20%").
  String get downPaymentPercentLabel => '${(downPaymentPercent * 100).round()}%';

  /// Membuat salinan instans [CreditSimulation] dengan atribut yang dimodifikasi.
  CreditSimulation copyWith({
    int? otrPrice,
    int? downPayment,
    double? downPaymentPercent,
    int? tenorMonths,
    double? annualInterestRate,
    int? principalAmount,
    int? totalInterest,
    int? totalLoan,
    int? monthlyInstallment,
  }) {
    return CreditSimulation(
      otrPrice: otrPrice ?? this.otrPrice,
      downPayment: downPayment ?? this.downPayment,
      downPaymentPercent: downPaymentPercent ?? this.downPaymentPercent,
      tenorMonths: tenorMonths ?? this.tenorMonths,
      annualInterestRate: annualInterestRate ?? this.annualInterestRate,
      principalAmount: principalAmount ?? this.principalAmount,
      totalInterest: totalInterest ?? this.totalInterest,
      totalLoan: totalLoan ?? this.totalLoan,
      monthlyInstallment: monthlyInstallment ?? this.monthlyInstallment,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreditSimulation &&
        other.otrPrice == otrPrice &&
        other.downPayment == downPayment &&
        (other.downPaymentPercent - downPaymentPercent).abs() < 0.0001 &&
        other.tenorMonths == tenorMonths &&
        (other.annualInterestRate - annualInterestRate).abs() < 0.0001 &&
        other.principalAmount == principalAmount &&
        other.totalInterest == totalInterest &&
        other.totalLoan == totalLoan &&
        other.monthlyInstallment == monthlyInstallment;
  }

  @override
  int get hashCode {
    return Object.hash(
      otrPrice,
      downPayment,
      downPaymentPercent,
      tenorMonths,
      annualInterestRate,
      principalAmount,
      totalInterest,
      totalLoan,
      monthlyInstallment,
    );
  }

  @override
  String toString() {
    return 'CreditSimulation(otr: $formattedOtrPrice, dp: $formattedDownPayment ($downPaymentPercentLabel), '
        'tenor: $tenorMonths bln, angsuran: $formattedMonthlyInstallment/bln)';
  }
}
