import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension StringExtension on String {
  Brightness toBrightness() {
    if(this == 'light') return Brightness.light;
    else if(this == 'dark') return Brightness.dark;
    else {
      throw 'Cant parse ${this} to Brightness';
    }
  }
}