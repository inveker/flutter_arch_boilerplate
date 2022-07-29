part of 'login_form_bloc.dart';

@freezed
class LoginFormEvent with _$LoginFormEvent {
  factory LoginFormEvent.changeLogin({
    required String login,
  }) = LoginFormChangeLoginEvent;

  factory LoginFormEvent.changePassword({
    required String password,
  }) = LoginFormChangePasswordEvent;

  factory LoginFormEvent.submit() = LoginFormSubmitEvent;
}
