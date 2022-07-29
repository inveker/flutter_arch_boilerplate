import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_arch_boilerplate/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_arch_boilerplate/router/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthenticationBloc authenticationBloc;

  AuthGuard({
    required this.authenticationBloc,
  });

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if(authenticationBloc.state.authentication != null) {
      resolver.next(true);
    } else {
      router.push(LoginRoute());
    }
  }
}