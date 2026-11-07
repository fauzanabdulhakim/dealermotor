// Entitas domain untuk banner promosi dan slider informasi di beranda aplikasi.

import 'package:flutter/foundation.dart';

/// Entitas domain murni yang merepresentasikan data banner promosi.
@immutable
class BannerPromo {
  /// Identifikasi unik dari banner promosi.
  final String id;

  /// URL tautan gambar banner.
  final String imageUrl;

  /// Judul promosi atau kampanye.
  final String title;

  /// Deskripsi singkat atau sub-judul promosi (opsional).
  final String? subtitle;

  /// URL target atau rute aksi saat banner ditekan (opsional).
  final String? targetUrl;

  const BannerPromo({
    required this.id,
    required this.imageUrl,
    this.title = '',
    this.subtitle,
    this.targetUrl,
  });

  /// Membuat salinan instans [BannerPromo] dengan nilai atribut yang diperbarui.
  BannerPromo copyWith({
    String? id,
    String? imageUrl,
    String? title,
    String? subtitle,
    String? targetUrl,
  }) {
    return BannerPromo(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      targetUrl: targetUrl ?? this.targetUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BannerPromo &&
        other.id == id &&
        other.imageUrl == imageUrl &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.targetUrl == targetUrl;
  }

  @override
  int get hashCode => Object.hash(id, imageUrl, title, subtitle, targetUrl);

  @override
  String toString() => 'BannerPromo(id: $id, title: $title, imageUrl: $imageUrl)';
}
