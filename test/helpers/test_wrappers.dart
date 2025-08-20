import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:warranty_saver/core/presentation/common/styles/custom_text_styles.dart';
import 'package:warranty_saver/core/presentation/common/styles/custom_colors.dart';

T resetAndRegister<T extends Object>(T instance) {
  GetIt.I.reset();
  GetIt.I.registerSingleton<T>(instance);
  return instance;
}

// ignore: unused_element
class _MapAssetLoader extends AssetLoader {
  const _MapAssetLoader(this.map);
  final Map<String, dynamic> map;
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async => map;
}

Widget wrapWithApp(
  GoRouter router, {
  Map<String, String> overrides = const {},
}) {
  final theme = ThemeData.light().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      CustomTextStyleScheme.fromPrimaryTextColor(primaryTextColor: Colors.black),
      CustomColorScheme.classic(),
    ],
  );

  return EasyLocalization(
    supportedLocales: const [Locale('en')],
    startLocale: const Locale('en'),
    path: 'unused',
    child: MaterialApp.router(
      routerConfig: router,
      theme: theme,
    ),
  );
}
