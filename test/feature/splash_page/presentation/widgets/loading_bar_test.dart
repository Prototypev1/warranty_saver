import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warranty_saver/feature/splash_page/presentation/widgets/loading_bar.dart';

void main() {
  testWidgets('loading bar calls oncomplete after animation', (tester) async {
    var called = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoadingBar(onComplete: () => called = true),
        ),
      ),
    );

    await tester.pump(const Duration(seconds: 3));
    expect(called, isTrue);
  });
}
