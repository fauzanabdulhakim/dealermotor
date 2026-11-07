// Implementasi sumber data lokal untuk katalog sepeda motor dan banner promosi.
// Bertanggung jawab memuat data mentah dari aset lokal / model statis dan mentransformasikannya
// menjadi entitas domain murni yang bersih, aman, dan tervalidasi.

import '../../core/utils/currency_formatter.dart';
import '../../domain/models/banner_promo.dart';
import '../../domain/models/motor.dart';
import '../../domain/models/motor_category.dart';
import '../../model/imagesliderdata.dart';
import '../../model/motordata.dart';
import 'motor_data_source.dart';

/// Implementasi [MotorDataSource] yang memuat dan menstandarkan data katalog motor lokal.
class LocalMotorDataSource implements MotorDataSource {
  /// Spesifikasi teknis resmi untuk sepeda motor listrik Honda EM1 e:.
  /// Menggantikan data mentah warisan yang sebelumnya salah memuat komponen mesin bensin.
  static const Map<String, Map<String, String>> _em1OfficialSpecifications = {
    'Mesin': {
      'Tipe Motor Listrik': 'In-wheel Brushless Electric Motor',
      'Daya Maksimum': '1.7 kW / 540 rpm',
      'Torsi Maksimum': '90 Nm / 25 rpm',
      'Mode Berkendara': 'ECON Mode / Normal Mode',
    },
    'Baterai & Pengisian Daya': {
      'Tipe Baterai': 'Honda Mobile Power Pack e: (Lithium-ion 50.26V 29.4Ah)',
      'Kapasitas Baterai': '50.26 V / 29.4 Ah (1.471 Wh)',
      'Jarak Tempuh': '41.1 km (WMTC Mode)',
      'Kecepatan Maksimum': '45 km/h',
      'Waktu Pengisian Daya':
          '0-100% 6 jam / 25-75% 2.7 jam (Honda Power Pack Charger e:)',
    },
    'Rangka & Kaki-kaki': {
      'Tipe Rangka': 'Underbone',
      'Tipe Suspensi Depan': 'Teleskopik',
      'Tipe Suspensi Belakang': 'Ganda (Dual Shock)',
      'Ukuran Ban Depan': '90/90 - 12 44J',
      'Ukuran Ban Belakang': '100/90 - 10 56J',
      'Rem Depan': 'Cakram Hidrolik',
      'Rem Belakang': 'Tromol',
      'Sistem Pengereman': 'Combi Brake System (CBS)',
    },
    'Dimensi & Berat': {
      'Panjang X Lebar X Tinggi': '1.795 x 680 x 1.080 mm',
      'Tinggi Tempat Duduk': '740 mm',
      'Jarak Sumbu Roda': '1.300 mm',
      'Jarak Terendah Ke Tanah': '135 mm',
      'Berat Kosong': '94 kg (dengan baterai MPP e:)',
    },
    'Kelistrikan': {
      'Lampu Depan': 'LED',
      'Lampu Belakang': 'LED',
      'Sistem Penguncian': 'Honda Smart Key System',
    },
  };

  /// Cache memori untuk menyimpan entitas motor yang telah ditransformasikan.
  List<Motor>? _cachedMotors;

  /// Cache memori untuk menyimpan entitas banner promosi.
  List<BannerPromo>? _cachedBanners;

  @override
  Future<List<Motor>> getMotors() async {
    if (_cachedMotors != null) {
      return _cachedMotors!;
    }

    final List<Motor> result = [];

    // 1. Transformasikan data motor kategori Matic
    for (final raw in maticData) {
      result.add(_transformMotorData(raw, MotorCategory.matic));
    }

    // 2. Transformasikan data motor kategori Sport
    for (final raw in sportData) {
      result.add(_transformMotorData(raw, MotorCategory.sport));
    }

    // 3. Transformasikan data motor kategori Cub (Bebek)
    for (final raw in cubData) {
      result.add(_transformMotorData(raw, MotorCategory.cub));
    }

    // 4. Transformasikan data motor kategori EV (Motor Listrik)
    for (final raw in evData) {
      result.add(_transformMotorData(raw, MotorCategory.ev));
    }

    _cachedMotors = List.unmodifiable(result);
    return _cachedMotors!;
  }

  @override
  Future<List<BannerPromo>> getBanners() async {
    if (_cachedBanners != null) {
      return _cachedBanners!;
    }

    final banners = imageSliderData.asMap().entries.map((entry) {
      final index = entry.key;
      final rawBanner = entry.value;
      return BannerPromo(
        id: 'banner-${index + 1}',
        imageUrl: rawBanner.imageUrl,
        title: 'Promo Spesial Honda #${index + 1}',
        subtitle: 'Dapatkan penawaran dan cicilan menarik untuk motor impian Anda.',
      );
    }).toList();

    _cachedBanners = List.unmodifiable(banners);
    return _cachedBanners!;
  }

  /// Mentransformasikan [MotorData] mentah menjadi entitas [Motor] domain.
  Motor _transformMotorData(MotorData raw, MotorCategory category) {
    final id = _generateId(raw.name);
    final price = CurrencyFormatter.parse(raw.price);

    // Filter gambar yang valid
    final images = raw.imageUrls
        .where((url) => url.trim().isNotEmpty)
        .toList();

    // Spesifikasi: Koreksi spesifikasi EV untuk Honda EM1 e:
    final Map<String, Map<String, String>> specifications;
    if (category == MotorCategory.ev || raw.name.toLowerCase().contains('em1')) {
      specifications = _em1OfficialSpecifications;
    } else {
      specifications = _transformSpecifications(raw.specifications);
    }

    final description = _buildDescription(raw.name, category);

    return Motor(
      id: id,
      name: raw.name,
      category: category,
      price: price,
      description: description,
      images: images,
      colors: images,
      specifications: specifications,
    );
  }

  /// Mengonversi struktur spesifikasi mentah `Map<String, List<Map<String, String>>>`
  /// menjadi struktur terindeks `Map<String, Map<String, String>>`.
  Map<String, Map<String, String>> _transformSpecifications(
    Map<String, List<Map<String, String>>> rawSpecs,
  ) {
    final Map<String, Map<String, String>> result = {};

    for (final groupEntry in rawSpecs.entries) {
      final groupName = groupEntry.key;
      final featureList = groupEntry.value;
      final Map<String, String> featureMap = {};

      for (final featureItem in featureList) {
        final feature = featureItem['Fitur']?.trim() ?? '';
        final detail = featureItem['Detail']?.trim() ?? '';
        if (feature.isNotEmpty) {
          featureMap[feature] = detail;
        }
      }

      if (featureMap.isNotEmpty) {
        result[groupName] = featureMap;
      }
    }

    return result;
  }

  /// Menghasilkan slug ID yang unik dan deterministik dari nama motor.
  String _generateId(String name) {
    return name
        .toLowerCase()
        .trim()
        .replaceAll(RegExp(r'[^a-z0-9]+'), '-')
        .replaceAll(RegExp(r'^-+|-+$'), '');
  }

  /// Menghasilkan deskripsi singkat produk berdasarkan kategori dan model motor.
  String _buildDescription(String name, MotorCategory category) {
    switch (category) {
      case MotorCategory.ev:
        return 'Sepeda motor listrik ramah lingkungan Honda $name dengan teknologi baterai Honda Mobile Power Pack e: untuk mobilitas perkotaan yang modern dan efisien.';
      case MotorCategory.sport:
        return 'Sepeda motor sport Honda $name dengan mesin bertenaga tinggi, akselerasi responsif, dan desain aerodinamis yang memukau.';
      case MotorCategory.cub:
        return 'Sepeda motor bebek Honda $name yang terbukti tangguh, irit bahan bakar, dan nyaman untuk penggunaan sehari-hari.';
      case MotorCategory.matic:
        return 'Skuter matik Honda $name yang praktis, lincah, serta dilengkapi fitur modern untuk kenyamanan berkendara di perkotaan.';
    }
  }
}
