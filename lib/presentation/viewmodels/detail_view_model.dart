// ViewModel untuk halaman detail katalog sepeda motor.
// Mengelola state seleksi varian motor (gambar & warna), kategori spesifikasi teknis aktif,
// serta kalkulasi interaktif simulasi kredit dan integrasi WhatsApp sales.

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../domain/models/credit_simulation.dart';
import '../../domain/models/motor.dart';
import '../../domain/services/credit_calculator_service.dart';

/// Tipe fungsi peluncur URL untuk memfasilitasi pengujian unit (mocking).
typedef UrlLauncherFunction = Future<bool> Function(Uri url, {LaunchMode mode});

/// ViewModel yang mengelola state dan interaksi pada halaman detail sepeda motor.
class DetailViewModel extends ChangeNotifier {
  /// Entitas data sepeda motor yang sedang dilihat.
  final Motor motor;

  /// Layanan domain untuk kalkulasi kredit.
  final CreditCalculatorService _creditCalculatorService;

  /// Delegasi fungsi peluncur URL untuk WhatsApp.
  final UrlLauncherFunction _urlLauncher;

  /// Indeks varian warna / gambar yang sedang aktif dipilih.
  int _selectedVariantIndex = 0;

  /// Kategori spesifikasi teknis yang sedang aktif dipilih (misal: 'Mesin', 'Rangka', 'Dimensi').
  String _selectedSpecCategory = '';

  /// Persentase uang muka (DP) terpilih (default: 20% / 0.20).
  double _downPaymentPercent;

  /// Pilihan tenor kredit dalam satuan bulan (default: 35 Bulan).
  int _selectedTenor;

  /// Membuat instans [DetailViewModel] dengan entitas [motor] yang wajib disediakan.
  DetailViewModel({
    required this.motor,
    int initialVariantIndex = 0,
    String? initialSpecCategory,
    double initialDownPaymentPercent = CreditCalculatorService.minimumDownPaymentPercent,
    int initialTenor = 35,
    CreditCalculatorService creditCalculatorService = const CreditCalculatorService(),
    UrlLauncherFunction? urlLauncher,
  })  : _selectedVariantIndex = initialVariantIndex,
        _downPaymentPercent = initialDownPaymentPercent < CreditCalculatorService.minimumDownPaymentPercent
            ? CreditCalculatorService.minimumDownPaymentPercent
            : initialDownPaymentPercent,
        _selectedTenor = initialTenor,
        _creditCalculatorService = creditCalculatorService,
        _urlLauncher = urlLauncher ?? launchUrl {
    // Inisialisasi kategori spesifikasi awal
    if (initialSpecCategory != null &&
        motor.specifications.containsKey(initialSpecCategory)) {
      _selectedSpecCategory = initialSpecCategory;
    } else if (motor.specifications.isNotEmpty) {
      _selectedSpecCategory = motor.specifications.keys.first;
    } else {
      _selectedSpecCategory = 'Mesin';
    }
  }

  /// Indeks varian warna / gambar yang sedang dipilih.
  int get selectedVariantIndex => _selectedVariantIndex;

  /// Kategori spesifikasi teknis yang sedang aktif dipilih.
  String get selectedSpecCategory => _selectedSpecCategory;

  /// Daftar semua kategori spesifikasi teknis yang tersedia pada motor ini.
  List<String> get availableSpecCategories => motor.specifications.keys.toList();

  /// Persentase uang muka (DP) yang sedang dipilih (0.20 s/d 0.70).
  double get downPaymentPercent => _downPaymentPercent;

  /// Pilihan tenor pembiayaan dalam bulan (misal: 11, 23, 29, 35).
  int get selectedTenor => _selectedTenor;

  /// Daftar tenor standar yang dapat dipilih oleh calon pembeli.
  List<int> get availableTenors => CreditCalculatorService.standardTenorMonths;

  /// Rincian simulasi kredit terkini berdasarkan DP dan tenor yang dipilih.
  CreditSimulation get creditSimulation {
    return _creditCalculatorService.calculate(
      otrPrice: motor.price,
      downPaymentPercent: _downPaymentPercent,
      tenorMonths: _selectedTenor,
    );
  }

  /// URL gambar dari varian motor yang sedang aktif dipilih.
  String get currentImage {
    if (motor.images.isEmpty) {
      return '';
    }
    if (_selectedVariantIndex >= 0 &&
        _selectedVariantIndex < motor.images.length) {
      return motor.images[_selectedVariantIndex];
    }
    return motor.primaryImage;
  }

  /// Nama warna atau label varian yang sedang aktif dipilih.
  String get currentColorName {
    if (motor.colors.isNotEmpty &&
        _selectedVariantIndex >= 0 &&
        _selectedVariantIndex < motor.colors.length) {
      final rawColor = motor.colors[_selectedVariantIndex];
      return _extractColorName(rawColor, _selectedVariantIndex);
    }
    if (motor.images.isNotEmpty &&
        _selectedVariantIndex >= 0 &&
        _selectedVariantIndex < motor.images.length) {
      final rawImage = motor.images[_selectedVariantIndex];
      return _extractColorName(rawImage, _selectedVariantIndex);
    }
    return 'Standar';
  }

  /// Map spesifikasi teknis (fitur -> nilai detail) untuk kategori spesifikasi yang aktif.
  Map<String, String> get currentSpecifications {
    return motor.specifications[_selectedSpecCategory] ?? const {};
  }

  /// Mengubah varian warna / gambar motor yang aktif.
  void selectVariant(int index) {
    if (index < 0 || index >= motor.images.length || index == _selectedVariantIndex) {
      return;
    }
    _selectedVariantIndex = index;
    notifyListeners();
  }

  /// Mengubah kategori spesifikasi teknis yang sedang dilihat.
  void selectSpecCategory(String category) {
    if (category == _selectedSpecCategory) {
      return;
    }
    _selectedSpecCategory = category;
    notifyListeners();
  }

  /// Memperbarui persentase uang muka (DP) dan memicu pembaruan kalkulasi kredit.
  /// Batas minimal otomatis dijaga pada 20% (0.20).
  void updateDownPaymentPercent(double percent) {
    final effectivePercent = percent < CreditCalculatorService.minimumDownPaymentPercent
        ? CreditCalculatorService.minimumDownPaymentPercent
        : (percent > CreditCalculatorService.maximumDownPaymentPercent
            ? CreditCalculatorService.maximumDownPaymentPercent
            : percent);

    if ((_downPaymentPercent - effectivePercent).abs() < 0.0001) {
      return;
    }

    _downPaymentPercent = effectivePercent;
    notifyListeners();
  }

  /// Memperbarui uang muka berdasarkan nominal Rupiah.
  void updateDownPaymentAmount(int amount) {
    if (motor.price <= 0) return;
    final percent = amount / motor.price;
    updateDownPaymentPercent(percent);
  }

  /// Memilih jangka waktu tenor pembiayaan kredit (dalam bulan).
  void selectTenor(int tenor) {
    if (tenor == _selectedTenor) {
      return;
    }
    _selectedTenor = tenor;
    notifyListeners();
  }

  /// Membuka aplikasi WhatsApp dengan draf pesan otomatis untuk konsultasi sales.
  Future<bool> contactSalesViaWhatsApp({
    String phoneNumber = '6281234567890',
  }) async {
    final cleanPhone = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    final draftMessage = _creditCalculatorService.generateWhatsAppMessage(
      motor: motor,
      variantColor: currentColorName,
      simulation: creditSimulation,
    );

    final urlString = 'https://wa.me/$cleanPhone?text=${Uri.encodeComponent(draftMessage)}';
    final uri = Uri.parse(urlString);

    try {
      return await _urlLauncher(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      return false;
    }
  }

  /// Helper untuk mengekstrak dan memformat nama warna secara elegan dari URL atau string raw.
  static String _extractColorName(String raw, int index) {
    final trimmed = raw.trim();
    if (trimmed.isEmpty) {
      return 'Varian ${index + 1}';
    }

    // Jika bukan URL atau path, langsung format string tersebut
    if (!trimmed.contains('/') && !trimmed.contains('.')) {
      return trimmed;
    }

    try {
      final uri = Uri.parse(trimmed);
      final segment = uri.pathSegments.isNotEmpty ? uri.pathSegments.last : '';
      final withoutExt = segment.replaceAll(
        RegExp(r'\.(jpg|jpeg|png|webp)$', caseSensitive: false),
        '',
      );

      // Bersihkan timestamp/angka duplikat pada nama file CDN Honda
      final cleaned = withoutExt
          .replaceAll(RegExp(r'-\d{6,}-\d{4,}'), '')
          .replaceAll(RegExp(r'-\d+-\d+$'), '')
          .replaceAll(
            RegExp(r'^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}-?'),
            '',
          )
          .replaceAll(RegExp(r'-\d+$'), '')
          .replaceAll(RegExp(r'[-_]'), ' ')
          .trim();

      if (cleaned.isNotEmpty && !RegExp(r'^[0-9]+$').hasMatch(cleaned)) {
        return cleaned
            .split(' ')
            .where((part) => part.isNotEmpty)
            .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
            .join(' ');
      }
    } catch (_) {
      // Abaikan parsing error jika URI tidak valid
    }

    return 'Varian ${index + 1}';
  }
}
