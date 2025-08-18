import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:warranty_saver/core/domain/repository/local_repository.dart';
import 'package:warranty_saver/feature/add_page.dart/presentation/add_page.dart';
import 'package:warranty_saver/feature/donations_page.dart/presentation/donations_page.dart';
import 'package:warranty_saver/feature/home_page/presentation/home_page.dart';
import 'package:warranty_saver/feature/login_page/presentation/login_page.dart';
import 'package:warranty_saver/feature/profile_page/presentation/profile_page.dart';
import 'package:warranty_saver/feature/splash_page/presentation/splash_page.dart';
import 'package:warranty_saver/feature/main_page_container/presentation/main_page_container.dart';
import 'package:warranty_saver/feature/register_page/presentation/register_page.dart';
import 'package:warranty_saver/feature/warranties_page/presentation/warranties_page.dart';

class RouterConfiguration {
  RouterConfiguration();

  late final GoRouter _goRouter;

  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

  GoRouter get router => _goRouter;

  void init() {
    _goRouter = GoRouter(
      navigatorKey: rootNavigatorKey, //custom.AppLifecycleListener.navigatorKey
      debugLogDiagnostics: kDebugMode,
      initialLocation: '/${SplashPage.pageName}',

      routes: <RouteBase>[
        GoRoute(
          path: '/${SplashPage.pageName}',
          name: SplashPage.pageName,
          pageBuilder: (context, state) => _getPage(
            key: state.pageKey,
            child: const SplashPage(),
          ),
        ),
        GoRoute(
          path: '/${RegisterPage.pageName}',
          name: RegisterPage.pageName,
          pageBuilder: (context, state) => _getPage(
            key: state.pageKey,
            child: const RegisterPage(),
          ),
        ),
        GoRoute(
          path: '/${LoginPage.pageName}',
          name: LoginPage.pageName,
          pageBuilder: (context, state) => _getPage(
            key: state.pageKey,
            child: const LoginPage(),
          ),
        ),
        ShellRoute(
          navigatorKey: shellNavigatorKey,
          builder: (context, state, child) => MainPageContainer(child: child),
          routes: [
            GoRoute(
              path: '/${HomePage.pageName}',
              name: HomePage.pageName,
              pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const HomePage()),
            ),
            GoRoute(
              path: '/${WarrantiesPage.pageName}',
              name: WarrantiesPage.pageName,
              pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const WarrantiesPage()),
            ),
            GoRoute(
              path: '/${AddPage.pageName}',
              name: AddPage.pageName,
              pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const AddPage()),
            ),
            GoRoute(
              path: '/${ProfilePage.pageName}',
              name: ProfilePage.pageName,
              pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const ProfilePage()),
            ),
            GoRoute(
              path: '/${DonationsPage.pageName}',
              name: DonationsPage.pageName,
              pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const DonationsPage()),
            ),
          ],
        ),
      ],
    );
  }

  Page<dynamic> _getPage({required ValueKey<dynamic> key, required Widget child}) {
    if (Platform.isAndroid) {
      return NoTransitionPage(key: key, child: child);
    } else {
      return CupertinoPage(key: key, child: child);
    }
  }
}
