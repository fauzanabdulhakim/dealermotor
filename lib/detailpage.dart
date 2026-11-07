// File: detailpage.dart
// Menghubungkan implementasi halaman detail warisan ke DetailView baru berbasis MVVM Clean Architecture.
// Mengeliminasi crash runtime Hero duplicate tag dan batas tinggi statis TabBarView.

import 'package:flutter/material.dart';
import 'domain/models/motor.dart';
import 'model/motordata.dart';
import 'presentation/views/detail_view.dart';

export 'presentation/views/detail_view.dart';

/// Halaman detail sepeda motor kompatibel yang mendelegasikan ke [DetailView].
/// Menerima parameter [motor] baik berupa entitas domain [Motor] maupun model legacy [MotorData].
@Deprecated('Gunakan DetailView pada lib/presentation/views/detail_view.dart')
class MotorDetailPage extends StatelessWidget {
  /// Entitas domain sepeda motor yang dikelola.
  final Motor motor;

  /// Konstruktor fleksibel yang menerima objek [Motor] atau [MotorData].
  MotorDetailPage({
    super.key,
    required dynamic motor,
  }) : motor = motor is Motor
            ? motor
            : convertLegacyMotorData(motor as MotorData);

  @override
  Widget build(BuildContext context) {
    return DetailView(motor: motor);
  }
}
