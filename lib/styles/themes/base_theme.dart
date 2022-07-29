import 'package:flutter/material.dart';
import 'package:flutter_arch_boilerplate/styles/app_fonts.dart';

abstract class BaseTheme {
  final ThemeData themeData;

  BaseTheme({
    required Brightness brightness,
  }) : themeData = ThemeData(
    brightness: brightness,
    fontFamily: AppFonts.roboto,
  );
}