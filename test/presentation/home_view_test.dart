// Pengujian widget untuk HomeView.
// Memverifikasi interaksi antarmuka beranda, SearchBar, tab kategori,
// carousel promosi, dan responsivitas grid motor.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dealermotor/presentation/viewmodels/home_view_model.dart';
import 'package:dealermotor/presentation/views/home_view.dart';
import 'package:dealermotor/presentation/widgets/motor_card.dart';
import 'package:dealermotor/presentation/widgets/promo_carousel_widget.dart';
import 'home_view_model_test.dart';

void main() {
  group('HomeView Widget Tests', () {
    late FakeMotorRepository fakeRepository;
    late HomeViewModel viewModel;

    setUp(() {
      fakeRepository = FakeMotorRepository();
      viewModel = HomeViewModel(repository: fakeRepository);
    });

    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: HomeView(
          viewModel: viewModel,
          autoPlayCarousel: false,
        ),
      );
    }

    testWidgets('Menampilkan AppBar dengan judul Motor Bike Deal tanpa ikon motor di samping judul', (WidgetTester tester) async {
      await viewModel.initialize();
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Motor Bike Deal'), findsOneWidget);
      expect(find.byIcon(Icons.motorcycle), findsNothing);
    });

    testWidgets('Menampilkan komponen utama: SearchBar, PromoCarousel, Kategori, dan MotorGrid', (WidgetTester tester) async {
      await viewModel.initialize();
      await tester.pumpWidget(createWidgetUnderTest());

      // Verifikasi SearchBar
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Cari model motor impian Anda...'), findsOneWidget);

      // Verifikasi Promo Carousel
      expect(find.byType(PromoCarouselWidget), findsOneWidget);

      // Verifikasi Tab Kategori (minimalis dengan garis indikator tanpa ChoiceChip/card)
      expect(find.text('Pilih Kategori Motor'), findsOneWidget);
      expect(find.text('Matic'), findsOneWidget);
      expect(find.text('Sport'), findsOneWidget);
      expect(find.text('Cub'), findsOneWidget);
      expect(find.text('EV'), findsOneWidget);

      // Verifikasi Kartu Motor (kategori matic default memuat 2 motor: BeAT dan Vario 160)
      expect(find.byType(MotorCard), findsNWidgets(2));
      expect(find.text('BeAT'), findsOneWidget);
      expect(find.text('Vario 160'), findsOneWidget);
    });

    testWidgets('Memilih kategori Sport mengubah daftar motor yang ditampilkan di grid', (WidgetTester tester) async {
      await viewModel.initialize();
      await tester.pumpWidget(createWidgetUnderTest());

      // Tekan tab kategori Sport
      await tester.tap(find.text('Sport'));
      await tester.pump(const Duration(milliseconds: 300));

      // Sekarang hanya CBR150R yang tampil
      expect(find.text('CBR150R'), findsOneWidget);
      expect(find.text('BeAT'), findsNothing);
    });

    testWidgets('Mengetik pada SearchBar memfilter kartu motor dan menampilkan empty state jika tidak cocok', (WidgetTester tester) async {
      await viewModel.initialize();
      await tester.pumpWidget(createWidgetUnderTest());

      // Ketik 'beat'
      await tester.enterText(find.byType(TextField), 'beat');
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('BeAT'), findsOneWidget);
      expect(find.text('Vario 160'), findsNothing);

      // Ketik kata acak yang tidak ada
      await tester.enterText(find.byType(TextField), 'tidak_ada_motor');
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Motor tidak ditemukan'), findsOneWidget);
    });

    testWidgets('Menampilkan pesan kesalahan jika inisialisasi gagal', (WidgetTester tester) async {
      fakeRepository.shouldThrowError = true;
      await viewModel.initialize();

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Terjadi kesalahan saat memuat data katalog'), findsOneWidget);
      expect(find.text('Coba Lagi'), findsOneWidget);
    });
  });
}
