// ViewModel untuk halaman utama (Home) aplikasi dealermotor.
// Mengelola state reaktif pemuatan data katalog motor, promosi banner,
// serta penyaringan berdasarkan kategori dan kata kunci pencarian.

import 'package:flutter/foundation.dart';
import '../../domain/models/banner_promo.dart';
import '../../domain/models/motor.dart';
import '../../domain/models/motor_category.dart';
import '../../domain/repositories/motor_repository.dart';

/// ViewModel reaktif untuk beranda aplikasi dealermotor.
///
/// Bertindak sebagai jembatan antara domain layer ([MotorRepository])
/// dengan antarmuka pengguna (View) menggunakan pola MVVM.
class HomeViewModel extends ChangeNotifier {
  final MotorRepository _repository;

  bool _isLoading = false;
  List<Motor> _allMotors = const [];
  List<Motor> _displayedMotors = const [];
  List<BannerPromo> _banners = const [];
  MotorCategory? _selectedCategory = MotorCategory.matic;
  String _searchQuery = '';
  String? _errorMessage;

  /// Membuat instans [HomeViewModel] dengan dependensi repositori [MotorRepository].
  HomeViewModel({required MotorRepository repository}) : _repository = repository;

  // --- Getter State ---

  /// Menandakan apakah proses asinkron sedang berlangsung.
  bool get isLoading => _isLoading;

  /// Seluruh data katalog sepeda motor yang berhasil dimuat.
  List<Motor> get allMotors => _allMotors;

  /// Daftar sepeda motor yang ditampilkan setelah diterapkan filter kategori dan pencarian.
  List<Motor> get displayedMotors => _displayedMotors;

  /// Daftar spanduk (banner) promosi aktif untuk carousel beranda.
  List<BannerPromo> get banners => _banners;

  /// Kategori motor yang saat ini sedang aktif dipilih.
  MotorCategory? get selectedCategory => _selectedCategory;

  /// Kata kunci pencarian yang sedang aktif.
  String get searchQuery => _searchQuery;

  /// Pesan kegagalan saat proses pemuatan data, atau `null` jika tidak terjadi kesalahan.
  String? get errorMessage => _errorMessage;

  // --- Aksi Bisnis Tampilan (Commands) ---

  /// Memuat data katalog motor dan banner promosi secara asinkron dari repositori.
  Future<void> initialize() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final motorsFuture = _repository.getAllMotors();
      final bannersFuture = _repository.getPromotionalBanners();

      final results = await Future.wait([motorsFuture, bannersFuture]);

      _allMotors = results[0] as List<Motor>;
      _banners = results[1] as List<BannerPromo>;
      _errorMessage = null;
      _applyFilter();
    } catch (e) {
      _errorMessage = e.toString();
      _allMotors = const [];
      _banners = const [];
      _displayedMotors = const [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Memilih kategori sepeda motor dan memperbarui daftar motor yang ditampilkan.
  void selectCategory(MotorCategory category) {
    if (_selectedCategory == category) return;
    _selectedCategory = category;
    _applyFilter();
    notifyListeners();
  }

  /// Memfilter daftar sepeda motor berdasarkan kata kunci nama produk (case-insensitive).
  void search(String query) {
    _searchQuery = query;
    _applyFilter();
    notifyListeners();
  }

  /// Mereset kata kunci pencarian dan mengembalikan daftar motor kategori aktif.
  void clearSearch() {
    if (_searchQuery.isEmpty) return;
    _searchQuery = '';
    _applyFilter();
    notifyListeners();
  }

  /// Menerapkan filter kategori dan kata kunci pencarian pada [_allMotors]
  /// untuk menghasilkan [_displayedMotors].
  void _applyFilter() {
    Iterable<Motor> filtered = _allMotors;

    // 1. Filter berdasarkan kategori terpilih
    if (_selectedCategory != null) {
      filtered = filtered.where((motor) => motor.category == _selectedCategory);
    }

    // 2. Filter berdasarkan kata kunci pencarian jika tersedia
    final trimmedQuery = _searchQuery.trim().toLowerCase();
    if (trimmedQuery.isNotEmpty) {
      filtered = filtered.where((motor) {
        final matchesName = motor.name.toLowerCase().contains(trimmedQuery);
        final matchesId = motor.id.toLowerCase().contains(trimmedQuery);
        return matchesName || matchesId;
      });
    }

    _displayedMotors = List.unmodifiable(filtered.toList());
  }
}
