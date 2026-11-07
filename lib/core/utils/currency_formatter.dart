// Utilitas pemformatan mata uang Rupiah untuk aplikasi dealermotor.
// Menggunakan paket intl untuk memastikan pemformatan sesuai standar lokal Indonesia (id_ID).

import 'package:intl/intl.dart';

/// Kelas utilitas statis untuk memformat dan mem-parsing mata uang Rupiah.
class CurrencyFormatter {
  CurrencyFormatter._();

  static final NumberFormat _formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  /// Memformat angka atau representasi teks angka ke format Rupiah (contoh: "Rp 21.000.000").
  ///
  /// Menerima parameter bertipe [num], [String], atau `null`.
  /// Jika nilai invalid atau `null`, akan mengembalikan default "Rp 0".
  static String format(dynamic amount) {
    if (amount == null) {
      return 'Rp 0';
    }

    num? numericValue;

    if (amount is num) {
      numericValue = amount;
    } else if (amount is String) {
      // Bersihkan string dari format non-angka jika perlu sebelum parse
      final cleanedString = amount.trim();
      numericValue = num.tryParse(cleanedString);
    }

    if (numericValue == null) {
      return 'Rp 0';
    }

    // Tangani nilai negatif agar format konsisten "-Rp X.XXX"
    if (numericValue < 0) {
      final positiveFormatted = _formatter.format(-numericValue).trim();
      return '-$positiveFormatted';
    }

    return _formatter.format(numericValue).trim();
  }

  /// Alias praktis untuk method [format].
  static String formatRupiah(dynamic amount) => format(amount);

  /// Mem-parsing string teks mata uang Rupiah kembali menjadi angka [int].
  ///
  /// Contoh: "Rp 21.000.000" -> 21000000.
  /// Mengembalikan `0` jika parsing gagal atau string kosong.
  static int parse(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 0;
    }

    // Ambil tanda minus jika ada
    final isNegative = value.contains('-');

    // Hapus semua karakter kecuali digit angka
    final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');
    if (digitsOnly.isEmpty) {
      return 0;
    }

    final parsedNumber = int.tryParse(digitsOnly) ?? 0;
    return isNegative ? -parsedNumber : parsedNumber;
  }
}
