// Kontrak antarmuka repositori untuk manajemen data sepeda motor dan banner promosi.
// Mengikuti prinsip Dependency Inversion (DIP) pada Clean Architecture.

import '../models/banner_promo.dart';
import '../models/motor.dart';
import '../models/motor_category.dart';

/// Kontrak abstraksi repositori untuk menyediakan data katalog motor dan konten promosi.
abstract class MotorRepository {
  /// Mengambil seluruh daftar sepeda motor dalam katalog.
  Future<List<Motor>> getAllMotors();

  /// Mengambil daftar sepeda motor berdasarkan kategori spesifik ([MotorCategory]).
  Future<List<Motor>> getMotorsByCategory(MotorCategory category);

  /// Mencari sepeda motor berdasarkan kata kunci nama produk (case-insensitive).
  ///
  /// Jika [query] kosong atau hanya memuat spasi, akan mengembalikan seluruh motor.
  Future<List<Motor>> searchMotors(String query);

  /// Mengambil data detail sepeda motor berdasarkan [id] unik.
  ///
  /// Mengembalikan `null` jika motor dengan ID tersebut tidak ditemukan.
  Future<Motor?> getMotorById(String id);

  /// Mengambil seluruh data banner promosi yang aktif untuk beranda aplikasi.
  Future<List<BannerPromo>> getPromotionalBanners();
}
