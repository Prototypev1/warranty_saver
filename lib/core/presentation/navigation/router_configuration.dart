import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class RouterConfiguration {
  RouterConfiguration();

  late final GoRouter _goRouter;

  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

  GoRouter get router => _goRouter;

  void init() {
    _goRouter = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: '/${LoadingScreen.pageName}',
      debugLogDiagnostics: kDebugMode,
      routes: <RouteBase>[
        GoRoute(
          path: '/${LoadingScreen.pageName}',
          name: LoadingScreen.pageName,
          pageBuilder: (context, state) => _getPage(key: state.pageKey, child: const LoadingScreen()),
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
              path: '/${ContactPage.pageName}',
              name: ContactPage.pageName,
              pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const ContactPage()),
            ),
          ],
        ),
      ],
    );
  }

  Page<dynamic> _getPage({required ValueKey<dynamic> key, required Widget child}) {
    if (kIsWeb) {
      return NoTransitionPage(key: key, child: child);
    }
    if (Platform.isAndroid) {
      return NoTransitionPage(key: key, child: child);
    } else {
      return CupertinoPage(key: key, child: child);
    }
  }
}
