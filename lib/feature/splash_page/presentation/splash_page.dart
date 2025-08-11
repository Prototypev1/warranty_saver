import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:warranty_saver/core/presentation/common/styles/custom_text_styles.dart';
import 'package:warranty_saver/feature/register_page/presentation/register_page.dart';
import 'package:warranty_saver/feature/splash_page/presentation/widgets/loading_bar.dart';
import 'package:warranty_saver/gen/locale_keys.g.dart';

class SplashPage extends StatelessWidget {
  static const pageName = 'splash';
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.splash_page_warranty_saver.tr(),
              style: CustomTextStyles.of(context).bold30.apply(color: Colors.black),
            ).tr(),
            Center(
              child: LoadingBar(
                onComplete: () => context.goNamed(RegisterPage.pageName),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
