part of 'theme_bloc.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  factory ThemeEvent.set({
    required Brightness brightness,
  }) = ThemeSetEvent;
}
