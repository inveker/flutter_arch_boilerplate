import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BrightnessExtension on Brightness {
  String get json => this == Brightness.light ? 'light' : 'dark';
}