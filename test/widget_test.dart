// Pengujian widget dasar untuk memastikan aplikasi dapat dimuat dengan baik.

import 'package:flutter_test/flutter_test.dart';
import 'package:dealermotor/main.dart';

void main() {
  testWidgets('MyApp dapat dimuat dan menampilkan SplashScreen', (WidgetTester tester) async {
    // Bangun aplikasi dan picu satu frame
    await tester.pumpWidget(const MyApp());

    // Pastikan SplashScreen muncul di awal
    expect(find.byType(SplashScreen), findsOneWidget);

    // Jalankan timer splashscreen agar tidak ada timer pending
    await tester.pump(const Duration(seconds: 3));
    await tester.pump();
  });
}
