part of 'login_form_bloc.dart';

@freezed
class LoginFormState with _$LoginFormState {
  factory LoginFormState({
    AuthenticationModel? authentication,
    @Default('') String login,
    String? loginError,
    @Default('') String password,
    String? passwordError,
    String? formError,
  }) = _LoginFormState;

  factory LoginFormState.fromJson(Map<String, Object?> json) => _$LoginFormStateFromJson(json);
}
