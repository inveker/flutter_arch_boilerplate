part of 'localization_bloc.dart';

@freezed
class LocalizationState with _$LocalizationState {
  factory LocalizationState({
    required String languageCode,
  }) = _LocalizationState;

  factory LocalizationState.fromJson(Map<String, Object?> json) => _$LocalizationStateFromJson(json);
}
