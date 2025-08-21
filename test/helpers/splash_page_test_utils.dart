import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:warranty_saver/feature/splash_page/presentation/splash_page.dart';
import 'package:warranty_saver/feature/register_page/presentation/register_page.dart';
import 'package:warranty_saver/feature/login_page/presentation/login_page.dart';
import 'package:warranty_saver/feature/home_page/presentation/home_page.dart';

class _RegisterScreen extends StatelessWidget {
  const _RegisterScreen();
  @override
  Widget build(BuildContext c) => const Scaffold(body: Center(child: Text('Register Screen')));
}

class _LoginScreen extends StatelessWidget {
  const _LoginScreen();
  @override
  Widget build(BuildContext c) => const Scaffold(body: Center(child: Text('Login Screen')));
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();
  @override
  Widget build(BuildContext c) => const Scaffold(body: Center(child: Text('Home Screen')));
}

GoRouter buildSplashRouter() => GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(name: SplashPage.pageName, path: '/', builder: (_, _) => const SplashPage()),
    GoRoute(name: RegisterPage.pageName, path: '/register', builder: (_, _) => const _RegisterScreen()),
    GoRoute(name: LoginPage.pageName, path: '/login', builder: (_, _) => const _LoginScreen()),
    GoRoute(name: HomePage.pageName, path: '/home', builder: (_, _) => const _HomeScreen()),
  ],
);

Future<void> fastForwardSplash(WidgetTester tester) async {
  await tester.pump(const Duration(seconds: 3));
  await tester.pumpAndSettle();
}
