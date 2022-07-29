import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_arch_boilerplate/models/authentication/authentication_model.dart';

part 'authentication_bloc.freezed.dart';

part 'authentication_bloc.g.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc extends HydratedBloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState()) {
    print(state);
    on<AuthenticationLoginEvent>(_login);
    on<AuthenticationLogoutEvent>(_logout);
  }

  Future<void> _login(AuthenticationLoginEvent event, Emitter<AuthenticationState> emit) async {
    emit(
      state.copyWith(
        authentication: event.authentication,
      ),
    );
  }

  Future<void> _logout(AuthenticationLogoutEvent event, Emitter<AuthenticationState> emit) async {
    final s = state.copyWith(
      authentication: null,
    );
    print(s);
    emit(
      state.copyWith(
        authentication: null,
      ),
    );
  }

  @override
  AuthenticationState? fromJson(Map<String, dynamic> json) {
    print('fromJson');
    return AuthenticationState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthenticationState state) {
    print('toJson');
    return state.toJson();
  }
}
