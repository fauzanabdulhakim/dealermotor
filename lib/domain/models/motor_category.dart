// Representasi kategori sepeda motor pada domain dealermotor.
// Membagi jenis motor ke dalam 4 kategori utama: Matic, Sport, Cub, dan EV (Motor Listrik).

/// Enum yang merepresentasikan kategori sepeda motor.
enum MotorCategory {
  /// Sepeda motor transmisi otomatis (skuter matik).
  matic,

  /// Sepeda motor sport dengan performa tinggi.
  sport,

  /// Sepeda motor bebek konvensional yang tangguh dan irit.
  cub,

  /// Sepeda motor listrik (Electric Vehicle) ramah lingkungan.
  ev;

  /// Label atau nama tampilan yang ramah pengguna.
  String get displayName {
    switch (this) {
      case MotorCategory.matic:
        return 'Matic';
      case MotorCategory.sport:
        return 'Sport';
      case MotorCategory.cub:
        return 'Cub';
      case MotorCategory.ev:
        return 'EV';
    }
  }

  /// Deskripsi singkat mengenai kategori sepeda motor.
  String get description {
    switch (this) {
      case MotorCategory.matic:
        return 'Sepeda motor otomatis praktis dan nyaman untuk mobilitas harian.';
      case MotorCategory.sport:
        return 'Sepeda motor berperforma tinggi dengan desain sporty dan agresif.';
      case MotorCategory.cub:
        return 'Sepeda motor bebek yang tangguh, irit bahan bakar, dan teruji.';
      case MotorCategory.ev:
        return 'Sepeda motor listrik modern tanpa emisi dan hemat energi.';
    }
  }

  /// Mengonversi nilai teks menjadi [MotorCategory].
  ///
  /// Mendukung pencocokan case-insensitive dan variasi nama umum.
  static MotorCategory fromString(String value) {
    final normalized = value.trim().toLowerCase();
    switch (normalized) {
      case 'matic':
      case 'skutik':
      case 'scooter':
        return MotorCategory.matic;
      case 'sport':
        return MotorCategory.sport;
      case 'cub':
      case 'bebek':
        return MotorCategory.cub;
      case 'ev':
      case 'electric':
      case 'listrik':
        return MotorCategory.ev;
      default:
        throw ArgumentError('Kategori motor tidak valid: "$value"');
    }
  }

  /// Mengonversi teks menjadi [MotorCategory], mengembalikan `null` jika tidak cocok.
  static MotorCategory? tryFromString(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    try {
      return fromString(value);
    } catch (_) {
      return null;
    }
  }
}
