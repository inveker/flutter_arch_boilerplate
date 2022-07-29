import 'package:auto_route/auto_route.dart';
import 'package:flutter_arch_boilerplate/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_arch_boilerplate/router/app_router.dart';

class UnAuthGuard extends AutoRouteGuard {

  final AuthenticationBloc authenticationBloc;

  UnAuthGuard({
    required this.authenticationBloc,
  });

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if(authenticationBloc.state.authentication != null) {
      router.push(MainRoute());
    } else {
      resolver.next(true);
    }
  }
}