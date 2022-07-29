import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_arch_boilerplate/api/api_exception.dart';
import 'package:flutter_arch_boilerplate/api/authentication_api.dart';
import 'package:flutter_arch_boilerplate/models/authentication/authentication_model.dart';

part 'register_form_bloc.freezed.dart';

part 'register_form_bloc.g.dart';

part 'register_form_event.dart';

part 'register_form_state.dart';

class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  final AppLocalizations l10n;

  RegisterFormBloc({
    required this.l10n,
  }) : super(RegisterFormState()) {
    on<RegisterFormChangeRegisterEvent>(_changeRegister);
    on<RegisterFormChangePasswordEvent>(_changePassword);
    on<RegisterFormSubmitEvent>(_submit);
  }

  String? _validateLogin(String login) {
    if (login.isEmpty) return l10n.emptyFieldError;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) return l10n.emptyFieldError;
  }

  Future<void> _changeRegister(RegisterFormChangeRegisterEvent event, Emitter<RegisterFormState> emit) async {
    emit(
      state.copyWith(
        login: event.login,
        loginError: _validateLogin(event.login),
      ),
    );
  }

  Future<void> _changePassword(RegisterFormChangePasswordEvent event, Emitter<RegisterFormState> emit) async {
    emit(
      state.copyWith(
        password: event.password,
        passwordError: _validatePassword(event.password),
      ),
    );
  }

  Future<void> _submit(RegisterFormSubmitEvent event, Emitter<RegisterFormState> emit) async {
    final loginError = _validateLogin(state.login);
    final passwordError = _validatePassword(state.password);

    RegisterFormState newState = state.copyWith(
      loginError: loginError,
      passwordError: passwordError,
    );

    emit(newState);

    if ([loginError, passwordError].every((element) => element == null)) {
      try {
        final authentication = await AuthenticationApi.register(
          login: state.login,
          password: state.password,
        );
        emit(
          newState.copyWith(
            authentication: authentication,
          ),
        );
      } on ApiException catch(e) {
        emit(
          newState.copyWith(
            formError: e.message,
          ),
        );
      }
    }
  }
}
