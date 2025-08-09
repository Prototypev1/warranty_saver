import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:warranty_saver/feature/splash_page/presentation/widgets/loading_bar.dart';
import 'package:warranty_saver/feature/register_page/presentation/register_page.dart';

class SplashPage extends StatelessWidget {
  static const pageName = 'splash';
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            LoadingBar(
              onComplete: () {
                context.goNamed(RegisterPage.pageName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
