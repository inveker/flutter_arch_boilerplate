import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch_boilerplate/utils/brightness_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_bloc.freezed.dart';

part 'theme_bloc.g.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc({
    required Brightness brightness,
  }) : super(ThemeState(brightness: brightness.json)) {
    on<ThemeSetEvent>(_set);
  }

  Brightness get currentBrightness => state.brightness == 'light' ? Brightness.light : Brightness.dark;

  Future<void> _set(ThemeSetEvent event, Emitter<ThemeState> emit) async {
    emit(
      state.copyWith(
        brightness: event.brightness.json,
      ),
    );
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toJson();
  }
}
