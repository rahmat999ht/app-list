import 'package:flutter/material.dart';

import 'colors.dart';

@immutable
class AppTheme {
  const AppTheme._();

  static final light = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      // background: ColorLight.whitePrimary,
      // onBackground: ColorLight.blackPrimary, // Text on background color
      primary: ColorLight.whitePrimary,
      onPrimary: ColorLight.blackPrimary,
      secondary: ColorLight.blueOnPrimary,
      onSecondary: ColorLight.textSecondary,
      surface: ColorLight.bluePrimary,
      onSurface: ColorLight.textPrimary,
      error: ColorLight.redPrimary,
    ),
  );
}