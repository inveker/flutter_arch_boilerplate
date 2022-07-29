part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  factory AuthenticationEvent.login({
    required AuthenticationModel authentication,
  }) = AuthenticationLoginEvent;

  factory AuthenticationEvent.logout() = AuthenticationLogoutEvent;
}
