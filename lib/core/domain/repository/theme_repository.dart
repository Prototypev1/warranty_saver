import 'package:flutter/material.dart';
import 'package:warranty_saver/core/presentation/common/styles/custom_colors.dart';
import 'package:warranty_saver/core/presentation/common/styles/custom_text_styles.dart';

class ThemeRepository {
  final _colorScheme = CustomColorScheme.classic();
  String? _appLogoSvgUrl;

  String? get appLogoSvgUrl => _appLogoSvgUrl;

  ThemeData buildTheme() {
    final textStyleScheme = CustomTextStyleScheme.fromPrimaryTextColor(primaryTextColor: _colorScheme.primaryText!);
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(color: _colorScheme.backgroundStartGradient),
      // fontFamily: 'Exo2',
      extensions: <ThemeExtension<dynamic>>[_colorScheme, textStyleScheme],
    );
  }
}
