part of 'localization_bloc.dart';

@freezed
class LocalizationEvent with _$LocalizationEvent {
  factory LocalizationEvent.setLanguageCode({
    required String languageCode,
  }) = LocalizationSetLanguageCodeEvent;
}
