// Implementasi konkret dari repositori MotorRepository.
// Menghubungkan abstraksi domain dengan sumber data (DataSource) sesuai Clean Architecture.

import '../../domain/models/banner_promo.dart';
import '../../domain/models/motor.dart';
import '../../domain/models/motor_category.dart';
import '../../domain/repositories/motor_repository.dart';
import '../datasources/local_motor_data_source.dart';
import '../datasources/motor_data_source.dart';

/// Implementasi repositori motor yang bertindak sebagai Single Source of Truth
/// untuk data katalog sepeda motor dan banner promosi.
class MotorRepositoryImpl implements MotorRepository {
  final MotorDataSource _dataSource;

  /// Membuat instans [MotorRepositoryImpl].
  ///
  /// Menerima [dataSource] opsional untuk memfasilitasi Dependency Injection dan mocking pada pengujian.
  /// Jika tidak dispesifikasikan, menggunakan [LocalMotorDataSource] sebagai default.
  MotorRepositoryImpl({MotorDataSource? dataSource})
      : _dataSource = dataSource ?? LocalMotorDataSource();

  @override
  Future<List<Motor>> getAllMotors() async {
    return _dataSource.getMotors();
  }

  @override
  Future<List<Motor>> getMotorsByCategory(MotorCategory category) async {
    final allMotors = await _dataSource.getMotors();
    return allMotors.where((motor) => motor.category == category).toList();
  }

  @override
  Future<List<Motor>> searchMotors(String query) async {
    final trimmedQuery = query.trim().toLowerCase();
    final allMotors = await _dataSource.getMotors();

    // Jika kata kunci kosong, kembalikan seluruh katalog motor
    if (trimmedQuery.isEmpty) {
      return allMotors;
    }

    return allMotors.where((motor) {
      final nameMatches = motor.name.toLowerCase().contains(trimmedQuery);
      final idMatches = motor.id.toLowerCase().contains(trimmedQuery);
      return nameMatches || idMatches;
    }).toList();
  }

  @override
  Future<Motor?> getMotorById(String id) async {
    final normalizedId = id.trim().toLowerCase();
    final allMotors = await _dataSource.getMotors();

    try {
      return allMotors.firstWhere((motor) => motor.id.toLowerCase() == normalizedId);
    } on StateError {
      return null;
    }
  }

  @override
  Future<List<BannerPromo>> getPromotionalBanners() async {
    return _dataSource.getBanners();
  }
}
