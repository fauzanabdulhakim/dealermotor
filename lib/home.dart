// File: home.dart
// Menghubungkan implementasi tampilan beranda ke HomeView baru berbasis pola MVVM Clean Architecture.

import 'package:flutter/material.dart';
import 'presentation/views/home_view.dart';

export 'presentation/views/home_view.dart';

/// Komponen halaman beranda warisan yang mendelegasikan ke [HomeView].
@Deprecated('Gunakan HomeView pada lib/presentation/views/home_view.dart')
class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
