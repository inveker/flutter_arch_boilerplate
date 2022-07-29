import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_arch_boilerplate/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_arch_boilerplate/bloc/login_form/login_form_bloc.dart';
import 'package:flutter_arch_boilerplate/router/app_router.dart';
import 'package:flutter_arch_boilerplate/utils/build_context_extension.dart';
import 'package:flutter_arch_boilerplate/utils/router_extension.dart';
import 'package:flutter_arch_boilerplate/widgets/forms/password_input_field.dart';
import 'package:flutter_arch_boilerplate/widgets/locales_dropdown.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Bloc(
      child: Scaffold(
        body: Center(
          child: Card(
            child: Container(
              width: 300,
              padding: EdgeInsets.all(20),
              child: _Form(),
            ),
          ),
        ),
      ),
    );
  }
}

class _Bloc extends StatelessWidget {
  final Widget child;

  const _Bloc({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocProvider(
      create: (context) => LoginFormBloc(
        l10n: l10n,
      ),
      child: BlocListener<LoginFormBloc, LoginFormState>(
        listenWhen: (p, n) => n.authentication != null,
        listener: (context, state) {
          context.read<AuthenticationBloc>().add(
                AuthenticationEvent.login(
                  authentication: state.authentication!,
                ),
              );
        },
        child: child,
      ),
    );
  }
}

class _Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Heading(),
        const SizedBox(height: 32),
        _LoginField(),
        const SizedBox(height: 16),
        _PasswordField(),
        const SizedBox(height: 32),
        _SubmitButton(),
        const SizedBox(height: 64),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LocalesDropdown(),
            _RegisterLink(),
          ],
        ),
      ],
    );
  }
}

class _Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.l10n.signIn,
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }
}

class _LoginField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (p, n) => p.loginError != n.loginError,
      builder: (context, state) {
        return TextField(
          decoration: InputDecoration(
            labelText: context.l10n.login,
            border: OutlineInputBorder(),
            errorText: state.loginError,
            helperText: '',
          ),
          onChanged: (value) {
            context.read<LoginFormBloc>().add(
              LoginFormEvent.changeLogin(
                login: value,
              ),
            );
          },
        );
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (p, n) => p.passwordError != n.passwordError,
      builder: (context, state) {
        return PasswordInputField(
          label: context.l10n.password,
          errorText: state.passwordError,
          helperText: '',
          onChanged: (value) {
            context.read<LoginFormBloc>().add(
              LoginFormEvent.changePassword(
                password: value,
              ),
            );
          },
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<LoginFormBloc>().add((LoginFormEvent.submit()));
      },
      child: Text(context.l10n.submit),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(0, 50),
      ),
    );
  }
}

class _RegisterLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(context.l10n.notHasAccount),
        const SizedBox(height: 8),
        ElevatedButton(
          child: Text(context.l10n.signUp),
          onPressed: () {
            context.router.push(RegisterRoute());
          },
        )
      ],
    );
  }
}
