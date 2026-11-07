// Entitas domain murni untuk sepeda motor.
// Bebas dari dependensi tampilan/framework UI, merepresentasikan entitas bisnis katalog motor.

import 'package:flutter/foundation.dart';
import '../../core/utils/currency_formatter.dart';
import 'motor_category.dart';

/// Entitas domain murni yang merepresentasikan data katalog sebuah sepeda motor.
@immutable
class Motor {
  /// Identifikasi unik dari sepeda motor (contoh: 'beat', 'em1-e', 'cbr150r').
  final String id;

  /// Nama model sepeda motor (contoh: 'BeAT', 'EM1 e:', 'CBR250RR').
  final String name;

  /// Kategori sepeda motor (matic, sport, cub, ev).
  final MotorCategory category;

  /// Harga sepeda motor dalam satuan bilangan bulat Rupiah (contoh: 18050000).
  final int price;

  /// Deskripsi singkat produk motor.
  final String description;

  /// Daftar URL gambar representasi motor.
  final List<String> images;

  /// Daftar varian warna atau gambar varian warna yang tersedia.
  final List<String> colors;

  /// Spesifikasi teknis terstruktur dikelompokkan berdasarkan kategori fitur.
  /// Format: `{ 'Nama Kategori': { 'Nama Fitur': 'Detail Nilai Fitur' } }`
  final Map<String, Map<String, String>> specifications;

  const Motor({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.description = '',
    required this.images,
    this.colors = const [],
    required this.specifications,
  });

  /// Mengembalikan harga terformat Rupiah (contoh: "Rp 18.050.000").
  String get formattedPrice => CurrencyFormatter.formatRupiah(price);

  /// Gambar utama atau thumbnail motor (gambar pertama pada daftar).
  String get primaryImage => images.isNotEmpty ? images.first : '';

  /// Alias daftar gambar untuk menjaga fleksibilitas dan kompatibilitas antarmuka.
  List<String> get imageUrls => images;

  /// Mengambil daftar spesifikasi dalam format baris tabel `[{'Fitur': ..., 'Detail': ...}]`
  /// berdasarkan kelompok kategori spesifikasi tertentu.
  List<Map<String, String>> getSpecificationList(String groupName) {
    final group = specifications[groupName];
    if (group == null || group.isEmpty) {
      return const [];
    }
    return group.entries
        .map((entry) => {'Fitur': entry.key, 'Detail': entry.value})
        .toList();
  }

  /// Membuat salinan instans [Motor] dengan atribut yang dimodifikasi.
  Motor copyWith({
    String? id,
    String? name,
    MotorCategory? category,
    int? price,
    String? description,
    List<String>? images,
    List<String>? colors,
    Map<String, Map<String, String>>? specifications,
  }) {
    return Motor(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      description: description ?? this.description,
      images: images ?? this.images,
      colors: colors ?? this.colors,
      specifications: specifications ?? this.specifications,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Motor &&
        other.id == id &&
        other.name == name &&
        other.category == category &&
        other.price == price &&
        other.description == description &&
        listEquals(other.images, images) &&
        listEquals(other.colors, colors) &&
        mapEquals(other.specifications, specifications);
  }

  @override
  int get hashCode => Object.hash(
        id,
        name,
        category,
        price,
        description,
        Object.hashAll(images),
        Object.hashAll(colors),
      );

  @override
  String toString() => 'Motor(id: $id, name: $name, category: ${category.name}, price: $price)';
}
