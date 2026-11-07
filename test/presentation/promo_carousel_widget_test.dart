// Pengujian widget untuk PromoCarouselWidget.
// Memverifikasi perenderan banner promosi dan isolasi indikator titik (dot indicator).

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dealermotor/domain/models/banner_promo.dart';
import 'package:dealermotor/presentation/widgets/promo_carousel_widget.dart';

void main() {
  const dummyBanners = [
    BannerPromo(
      id: 'banner-1',
      imageUrl: 'https://example.com/banner1.png',
      title: 'Promo Spesial 1',
    ),
    BannerPromo(
      id: 'banner-2',
      imageUrl: 'https://example.com/banner2.png',
      title: 'Promo Spesial 2',
    ),
  ];

  Widget createWidgetUnderTest({
    List<BannerPromo> banners = dummyBanners,
    void Function(BannerPromo)? onBannerTap,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 400,
            height: 300,
            child: PromoCarouselWidget(
              banners: banners,
              onBannerTap: onBannerTap,
            ),
          ),
        ),
      ),
    );
  }

  group('PromoCarouselWidget Tests', () {
    testWidgets('Tidak merender apa pun (SizedBox.shrink) jika daftar banner kosong', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(banners: []));

      expect(find.byType(PromoCarouselWidget), findsOneWidget);
      expect(find.byType(ValueListenableBuilder<int>), findsNothing);
    });

    testWidgets('Merender banner gambar dan indikator titik tanpa teks judul promo', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Memastikan widget indikator titik berbasis ValueListenableBuilder ter-render
      expect(find.byType(ValueListenableBuilder<int>), findsOneWidget);

      // Memastikan teks judul banner telah dihilangkan sesuai instruksi UI
      expect(find.text('Promo Spesial 1'), findsNothing);
    });
  });
}
