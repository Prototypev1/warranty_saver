import 'package:flutter/material.dart';
import 'package:warranty_saver/core/presentation/common/styles/custom_text_styles.dart';
import 'package:warranty_saver/core/presentation/common/styles/custom_colors.dart';

ThemeData buildTestTheme() {
  return ThemeData.light().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      CustomTextStyleScheme.fromPrimaryTextColor(primaryTextColor: Colors.black),
      CustomColorScheme.classic(),
    ],
  );
}
