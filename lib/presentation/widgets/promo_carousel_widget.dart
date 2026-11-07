// Komponen carousel banner promosi dengan isolasi state indikator titik (dot indicator).
// Mencegah rebuild seluruh widget beranda saat terjadi transisi slide banner.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../domain/models/banner_promo.dart';

/// Widget slider banner promosi beranda.
///
/// Menggunakan [ValueNotifier] terisolasi untuk mengelola indeks halaman aktif
/// sehingga event `onPageChanged` hanya merebuild baris indikator titik.
class PromoCarouselWidget extends StatefulWidget {
  /// Daftar data banner promosi yang ditampilkan pada slider.
  final List<BannerPromo> banners;

  /// Aksi opsional ketika salah satu banner ditekan.
  final void Function(BannerPromo banner)? onBannerTap;

  /// Tinggi dari carousel slider (default: 190.0).
  final double height;

  /// Menentukan apakah banner bergeser secara otomatis (default: true).
  final bool autoPlay;

  const PromoCarouselWidget({
    super.key,
    required this.banners,
    this.onBannerTap,
    this.height = 190.0,
    this.autoPlay = true,
  });

  @override
  State<PromoCarouselWidget> createState() => _PromoCarouselWidgetState();
}

class _PromoCarouselWidgetState extends State<PromoCarouselWidget> {
  late final ValueNotifier<int> _currentSlideNotifier;
  late final CarouselSliderController _carouselController;

  @override
  void initState() {
    super.initState();
    _currentSlideNotifier = ValueNotifier<int>(0);
    _carouselController = CarouselSliderController();
  }

  @override
  void dispose() {
    _currentSlideNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 1. Slider Gambar Promosi
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: widget.banners.length,
          options: CarouselOptions(
            height: widget.height,
            autoPlay: widget.autoPlay && widget.banners.length > 1,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 600),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              // Hanya memperbarui notifikasi lokal, tanpa memicu rebuild seluruh halaman
              _currentSlideNotifier.value = index;
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final banner = widget.banners[index];
            return GestureDetector(
              onTap: () => widget.onBannerTap?.call(banner),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: banner.imageUrl,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(
                    child: SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(strokeWidth: 2.5),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.campaign_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 8.0),

        // 2. Indikator Titik Terisolasi menggunakan ValueListenableBuilder
        ValueListenableBuilder<int>(
          valueListenable: _currentSlideNotifier,
          builder: (context, currentIndex, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.banners.asMap().entries.map((entry) {
                final isSelected = currentIndex == entry.key;
                return GestureDetector(
                  onTap: () {
                    _carouselController.animateToPage(
                      entry.key,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 3.0),
                    height: 6.0,
                    width: isSelected ? 20.0 : 6.0,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.red.shade700 : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
