// splash_page.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:warranty_saver/core/presentation/common/styles/custom_text_styles.dart';
import 'package:warranty_saver/core/domain/repository/local_repository.dart';
import 'package:warranty_saver/feature/register_page/presentation/register_page.dart';
import 'package:warranty_saver/feature/login_page/presentation/login_page.dart';
import 'package:warranty_saver/feature/home_page/presentation/home_page.dart';
import 'package:warranty_saver/feature/splash_page/presentation/widgets/loading_bar.dart';
import 'package:warranty_saver/gen/locale_keys.g.dart';

class SplashPage extends StatelessWidget {
  static const pageName = 'splash';
  const SplashPage({super.key});

  Future<void> _routeAfterSplash(BuildContext context) async {
    final repo = GetIt.I<LocalRepository>();

    final isFirstLaunch = await repo.isFirstLaunch();
    if (isFirstLaunch && context.mounted) {
      context.goNamed(RegisterPage.pageName);
      return;
    }

    final isLoggedIn = await repo.isLoggedIn();
    final isRemembered = await repo.isDeviceRemembered();

    if (isLoggedIn && isRemembered && context.mounted) {
      context.goNamed(HomePage.pageName);
    } else {
      if (context.mounted) {
        context.goNamed(LoginPage.pageName);
      }
    }
  }

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
            ),
            Center(
              child: LoadingBar(
                onComplete: () => _routeAfterSplash(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// SplashPage build: keep UI; only change onComplete:
// LoadingBar(
//   onComplete: () async {
//     final repo = GetIt.I<LocalRepository>();

//     final isFirst = await repo.isFirstLaunch();
//     final isLoggedIn = await repo.isLoggedIn();
//     final isRemembered = await repo.isDeviceRemembered();
//     debugPrint('Splash route checks => isFirst:$isFirst loggedIn:$isLoggedIn remembered:$isRemembered');

//     if (isFirst) {
//       context.goNamed(RegisterPage.pageName);
//       return;
//     }

//     if (isLoggedIn && isRemembered) {
//       context.goNamed(HomePage.pageName);
//     } else {
//       context.goNamed(LoginPage.pageName);
//     }
//   },
// ),
