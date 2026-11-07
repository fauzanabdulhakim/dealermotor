// Kontrak abstraksi data source untuk penyediaan data mentah katalog motor dan banner.
// Mengikuti prinsip Interface Segregation (ISP) dan Dependency Inversion (DIP).

import '../../domain/models/banner_promo.dart';
import '../../domain/models/motor.dart';

/// Kontrak abstraksi sumber data motor.
abstract class MotorDataSource {
  /// Mengambil daftar seluruh sepeda motor yang tersedia dari sumber data.
  Future<List<Motor>> getMotors();

  /// Mengambil daftar banner promosi dari sumber data.
  Future<List<BannerPromo>> getBanners();
}
