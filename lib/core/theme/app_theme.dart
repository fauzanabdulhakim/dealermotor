// Konfigurasi tema terpusat untuk aplikasi dealermotor.
// Menerapkan Material 3 dan palet warna merah khas dealer motor Honda/Bike Deal.

import 'package:flutter/material.dart';
import '../../domain/models/motor_category.dart';

/// Kelas penyedia tema aplikasi (terpusat).
class AppTheme {
  AppTheme._();

  // Warna utama aplikasi
  static const Color primaryColor = Color(0xFFD32F2F); // Colors.red.shade700
  static const Color primaryDark = Color(0xFFB71C1C); // Colors.red.shade900
  static const Color accentColor = Color(0xFFE53935); // Colors.red.shade600
  static const Color surfaceColor = Colors.white;
  static const Color backgroundColor = Color(0xFFF8F9FA);

  /// Skema tema terang (Light Theme) berbasis Material 3.
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: accentColor,
      surface: surfaceColor,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.15,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        color: surfaceColor,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: primaryColor,
        ),
      ),
      dividerTheme: const DividerThemeData(
        space: 1,
        thickness: 1,
        color: Color(0xFFEEEEEE),
      ),
    );
  }

  /// Mengembalikan warna badge aksen terpusat berdasarkan Kategori Motor.
  static Color getCategoryColor(MotorCategory category) {
    switch (category) {
      case MotorCategory.matic:
        return Colors.blue.shade700;
      case MotorCategory.sport:
        return primaryColor;
      case MotorCategory.cub:
        return Colors.teal.shade700;
      case MotorCategory.ev:
        return Colors.green.shade700;
    }
  }
}
