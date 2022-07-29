import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations get l10n {
    AppLocalizations? localizations = AppLocalizations.of(this);
    if(localizations != null) {
      return localizations;
    } else {
      throw Exception('AppLocalizations not found in current context');
    }
  }
}