part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  factory ThemeState({
    required String brightness,
  }) = _ThemeState;

  factory ThemeState.fromJson(Map<String, Object?> json) => _$ThemeStateFromJson(json);
}
