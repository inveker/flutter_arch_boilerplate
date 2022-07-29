part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  factory AuthenticationState({
    AuthenticationModel? authentication,
  }) = _AuthenticationState;


  factory AuthenticationState.fromJson(Map<String, Object?> json) => _$AuthenticationStateFromJson(json);
}
