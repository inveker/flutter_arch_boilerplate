part of 'register_form_bloc.dart';

@freezed
class RegisterFormState with _$RegisterFormState {
  factory RegisterFormState({
    AuthenticationModel? authentication,
    @Default('') String login,
    String? loginError,
    @Default('') String password,
    String? passwordError,
    String? formError,
  }) = _RegisterFormState;

  factory RegisterFormState.fromJson(Map<String, Object?> json) => _$RegisterFormStateFromJson(json);
}
