// Titik masuk utama aplikasi dealermotor.
// Mengonfigurasi MultiProvider dependensi injeksi, MaterialApp, tema global, dan Splash Screen.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'data/datasources/local_motor_data_source.dart';
import 'data/repositories/motor_repository_impl.dart';
import 'domain/repositories/motor_repository.dart';
import 'presentation/viewmodels/home_view_model.dart';
import 'presentation/views/home_view.dart';

void main() => runApp(const MyApp());

/// Root widget aplikasi dealermotor dengan penyediaan state terpusat MultiProvider.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MotorRepository>(
          create: (_) => MotorRepositoryImpl(dataSource: LocalMotorDataSource()),
        ),
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(
            repository: context.read<MotorRepository>(),
          )..initialize(),
        ),
      ],
      child: MaterialApp(
        title: 'Motor Bike Deal',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}

/// Layar SplashScreen responsif dan ringan yang tampil saat aplikasi pertama kali dibuka.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = Tween<double>(begin: 0.88, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeIn),
    );
    _animController.forward();

    // Berpindah ke HomeView setelah jeda cepat dan responsif (1 detik)
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 350),
          pageBuilder: (context, animation, secondaryAnimation) => const HomeView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Image(
                  image: AssetImage('assets/logo.png'),
                  width: 220,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red.shade700),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
