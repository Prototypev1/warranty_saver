import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:warranty_saver/core/domain/repository/local_repository.dart';
import 'package:warranty_saver/core/presentation/common/styles/custom_text_styles.dart';
import 'package:warranty_saver/core/presentation/common/styles/custom_colors.dart';
import 'package:warranty_saver/feature/home_page/presentation/home_page.dart';
import 'package:warranty_saver/feature/login_page/presentation/login_page.dart';
import 'package:warranty_saver/feature/register_page/presentation/register_page.dart';
import 'package:warranty_saver/feature/splash_page/presentation/splash_page.dart';

class MockLocalRepository extends Mock implements LocalRepository {}

class _MapAssetLoader extends AssetLoader {
  const _MapAssetLoader(this.map);
  final Map<String, dynamic> map;
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async => map;
}

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

GoRouter _buildTestRouter() => GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: SplashPage.pageName,
      path: '/',
      builder: (_, __) => const SplashPage(),
    ),
    GoRoute(
      name: RegisterPage.pageName,
      path: '/register',
      builder: (_, __) => const _RegisterScreen(),
    ),
    GoRoute(
      name: LoginPage.pageName,
      path: '/login',
      builder: (_, __) => const _LoginScreen(),
    ),
    GoRoute(
      name: HomePage.pageName,
      path: '/home',
      builder: (_, __) => const _HomeScreen(),
    ),
  ],
);

Widget _wrapWithApp(GoRouter router) {
  final theme = ThemeData.light().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      CustomTextStyleScheme.fromPrimaryTextColor(primaryTextColor: Colors.black),
      CustomColorScheme.classic(),
    ],
  );

  final loader = _MapAssetLoader({
    'splash_page.warranty_saver': 'Warranty Saver',
  });

  return EasyLocalization(
    supportedLocales: const [Locale('en')],
    startLocale: const Locale('en'),
    path: 'unused',
    assetLoader: loader,
    child: MaterialApp.router(
      routerConfig: router,
      theme: theme,
    ),
  );
}

Future<void> _fastForwardSplash(WidgetTester tester) async {
  await tester.pump(const Duration(seconds: 3));

  await tester.pumpAndSettle();
}

void main() {
  late MockLocalRepository repo;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    SharedPreferences.setMockInitialValues({});

    await EasyLocalization.ensureInitialized();

    repo = MockLocalRepository();

    GetIt.I.reset();

    GetIt.I.registerSingleton<LocalRepository>(repo);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  testWidgets('first launch -> Register', (tester) async {
    when(() => repo.isFirstLaunch()).thenAnswer((_) async => true);
    when(() => repo.isLoggedIn()).thenAnswer((_) async => false);
    when(() => repo.isDeviceRemembered()).thenAnswer((_) async => false);

    await tester.pumpWidget(_wrapWithApp(_buildTestRouter()));
    await _fastForwardSplash(tester);

    expect(find.text('Register Screen'), findsOneWidget);
  });

  testWidgets('logged in & remembered -> Home', (tester) async {
    when(() => repo.isFirstLaunch()).thenAnswer((_) async => false);
    when(() => repo.isLoggedIn()).thenAnswer((_) async => true);
    when(() => repo.isDeviceRemembered()).thenAnswer((_) async => true);

    await tester.pumpWidget(_wrapWithApp(_buildTestRouter()));
    await _fastForwardSplash(tester);

    expect(find.text('Home Screen'), findsOneWidget);
  });

  testWidgets('otherwise -> Login', (tester) async {
    when(() => repo.isFirstLaunch()).thenAnswer((_) async => false);
    when(() => repo.isLoggedIn()).thenAnswer((_) async => false);
    when(() => repo.isDeviceRemembered()).thenAnswer((_) async => false);

    await tester.pumpWidget(_wrapWithApp(_buildTestRouter()));
    await _fastForwardSplash(tester);

    expect(find.text('Login Screen'), findsOneWidget);
  });
}
