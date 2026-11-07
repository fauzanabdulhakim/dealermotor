// Komponen kartu produk sepeda motor berdesain Material 3.
// Menampilkan gambar beranimasi Hero, badge kategori, nama model, dan harga OTR terformat Rupiah.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../domain/models/motor.dart';

/// Kartu katalog sepeda motor elegan berbasis Material 3.
class MotorCard extends StatelessWidget {
  /// Entitas data sepeda motor yang ditampilkan.
  final Motor motor;

  /// Aksi callback saat kartu ditekan oleh pengguna.
  final VoidCallback? onTap;

  const MotorCard({
    super.key,
    required this.motor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 1.0,
      shadowColor: Colors.black.withValues(alpha: 0.12),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: Colors.grey.shade200, width: 1.0),
      ),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.red.shade50,
        highlightColor: Colors.red.shade50.withValues(alpha: 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Gambar produk tanpa jarak di sisi kiri, atas, dan kanan (edge-to-edge dengan border radius kartu)
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF8F9FA),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
                child: Center(
                  child: Hero(
                    tag: 'hero_motor_${motor.id}_0',
                    child: motor.primaryImage.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: motor.primaryImage,
                            memCacheWidth: 600,
                            fit: BoxFit.contain,
                            placeholder: (context, url) => const Center(
                              child: SizedBox(
                                width: 28,
                                height: 28,
                                child: CircularProgressIndicator(strokeWidth: 2.5),
                              ),
                            ),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.broken_image_outlined,
                              size: 48,
                              color: Colors.grey,
                            ),
                          )
                        : const Icon(
                            Icons.motorcycle,
                            size: 48,
                            color: Colors.grey,
                          ),
                  ),
                ),
              ),
            ),

            // 2. Informasi Nama Motor dan Harga OTR dengan padding rapi
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    motor.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    motor.formattedPrice,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.red.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
