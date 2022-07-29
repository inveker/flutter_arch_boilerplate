import 'package:flutter/material.dart';
import 'package:flutter_arch_boilerplate/styles/themes/dark_theme.dart';
import 'package:flutter_arch_boilerplate/styles/themes/light_theme.dart';

class AppTheme {
  static late final LightTheme _lightTheme = LightTheme();
  static late final DarkTheme _darkTheme = DarkTheme();

  static ThemeData build(Brightness brightness) {
    final theme = brightness == Brightness.light ? _lightTheme : _darkTheme;
    return theme.themeData;
  }
}