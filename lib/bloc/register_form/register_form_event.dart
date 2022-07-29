part of 'register_form_bloc.dart';

@freezed
class RegisterFormEvent with _$RegisterFormEvent {
  factory RegisterFormEvent.changeLogin({
    required String login,
  }) = RegisterFormChangeRegisterEvent;

  factory RegisterFormEvent.changePassword({
    required String password,
  }) = RegisterFormChangePasswordEvent;

  factory RegisterFormEvent.submit() = RegisterFormSubmitEvent;
}
