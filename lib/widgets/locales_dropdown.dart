import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_arch_boilerplate/bloc/localization/localization_bloc.dart';
import 'package:provider/src/provider.dart';

class LocalesDropdown extends StatelessWidget {
  const LocalesDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        return DropdownButton<Locale>(
          underline: SizedBox(),
          value: Locale(state.languageCode),
          items: [
            for (final locale in AppLocalizations.supportedLocales)
              DropdownMenuItem(
                child: Text(locale.languageCode),
                value: Locale(locale.languageCode),
              ),
          ],
          onChanged: (locale) {
            context.read<LocalizationBloc>().add(
              LocalizationEvent.setLanguageCode(
                languageCode: locale!.languageCode,
              ),
            );
          },
        );
      },
    );
  }
}
