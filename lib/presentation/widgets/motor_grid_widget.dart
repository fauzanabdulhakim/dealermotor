// Komponen grid katalog motor responsif multi-platform (Mobile, Tablet, Desktop/Web).
// Menggunakan LayoutBuilder untuk menghitung rasio aspek dan kolom secara dinamis tanpa layout overflow.

import 'package:flutter/material.dart';
import '../../domain/models/motor.dart';
import 'motor_card.dart';

/// Widget grid responsif untuk menampilkan daftar sepeda motor.
class MotorGridWidget extends StatelessWidget {
  /// Daftar sepeda motor yang akan dirender dalam grid.
  final List<Motor> motors;

  /// Aksi callback saat salah satu item motor ditekan.
  final void Function(Motor motor)? onMotorTap;

  /// Apakah grid dibungkus dalam SingleChildScrollView induk (shrinkWrap aktif).
  final bool shrinkWrap;

  /// Scroll physics untuk grid.
  final ScrollPhysics? physics;

  const MotorGridWidget({
    super.key,
    required this.motors,
    this.onMotorTap,
    this.shrinkWrap = false,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    if (motors.isEmpty) {
      return _buildEmptyState(context);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        // 1. Hitung jumlah kolom grid dan rasio aspek berdasarkan lebar layar
        final int crossAxisCount;
        final double childAspectRatio;

        if (screenWidth < 600) {
          // Mobile (< 600 dp)
          crossAxisCount = 2;
          childAspectRatio = 0.72;
        } else if (screenWidth <= 1024) {
          // Tablet (600 - 1024 dp)
          crossAxisCount = screenWidth < 800 ? 3 : 4;
          childAspectRatio = 0.74;
        } else {
          // Desktop / Web (> 1024 dp)
          crossAxisCount = screenWidth < 1400 ? 4 : 5;
          childAspectRatio = 0.75;
        }

        final gridView = GridView.builder(
          shrinkWrap: shrinkWrap,
          physics: physics,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
          ),
          itemCount: motors.length,
          itemBuilder: (context, index) {
            final motor = motors[index];
            return MotorCard(
              motor: motor,
              onTap: () => onMotorTap?.call(motor),
            );
          },
        );

        // Jika pada layar lebar (Desktop/Web), batasi lebar maksimal pada kontainer terpusat (max 1200 dp)
        if (screenWidth > 1024) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: gridView,
            ),
          );
        }

        return gridView;
      },
    );
  }

  /// Tampilan state kosong jika tidak ada motor yang cocok dengan filter atau kata kunci.
  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'Motor tidak ditemukan',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Coba gunakan kata kunci pencarian lain atau pilih kategori yang berbeda.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
