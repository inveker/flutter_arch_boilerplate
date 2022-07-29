import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'localization_bloc.freezed.dart';

part 'localization_bloc.g.dart';

part 'localization_event.dart';

part 'localization_state.dart';

class LocalizationBloc extends HydratedBloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc({
    required String languageCode,
  }) : super(LocalizationState(
          languageCode: languageCode.substring(0, 2),
        )) {
    on<LocalizationSetLanguageCodeEvent>(_setLocale);
  }

  Future<void> _setLocale(LocalizationSetLanguageCodeEvent event, Emitter<LocalizationState> emit) async {
    emit(
      state.copyWith(
        languageCode: event.languageCode,
      ),
    );
  }

  @override
  LocalizationState? fromJson(Map<String, dynamic> json) {
    return LocalizationState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(LocalizationState state) {
    return state.toJson();
  }
}
