// Pengujian unit untuk CurrencyFormatter.
// Memastikan pemformatan angka ke mata uang Rupiah berjalan sesuai standar Indonesia.

import 'package:flutter_test/flutter_test.dart';
import 'package:dealermotor/core/utils/currency_formatter.dart';

void main() {
  group('CurrencyFormatter', () {
    test('memformat angka integer positif ke format Rupiah', () {
      expect(CurrencyFormatter.format(21000000), 'Rp 21.000.000');
      expect(CurrencyFormatter.format(18050000), 'Rp 18.050.000');
      expect(CurrencyFormatter.format(500), 'Rp 500');
    });

    test('memformat angka 0 ke format Rupiah', () {
      expect(CurrencyFormatter.format(0), 'Rp 0');
    });

    test('memformat angka negatif ke format Rupiah', () {
      expect(CurrencyFormatter.format(-50000), '-Rp 50.000');
    });

    test('memformat angka desimal (double) ke format Rupiah bulat', () {
      expect(CurrencyFormatter.format(2500000.0), 'Rp 2.500.000');
    });

    test('memformat string angka menjadi format Rupiah', () {
      expect(CurrencyFormatter.format('21000000'), 'Rp 21.000.000');
      expect(CurrencyFormatter.format('0'), 'Rp 0');
      expect(CurrencyFormatter.format('-15000'), '-Rp 15.000');
    });

    test('parsing string Rupiah atau angka kembali menjadi integer', () {
      expect(CurrencyFormatter.parse('Rp 21.000.000'), 21000000);
      expect(CurrencyFormatter.parse('21000000'), 21000000);
      expect(CurrencyFormatter.parse('Rp 0'), 0);
      expect(CurrencyFormatter.parse(''), 0);
    });

    test('memformat nilai null atau invalid secara aman', () {
      expect(CurrencyFormatter.format(null), 'Rp 0');
      expect(CurrencyFormatter.format('bukan_angka'), 'Rp 0');
    });
  });
}
