import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_arch_boilerplate/router/guards/auth_guard.dart';
import 'package:flutter_arch_boilerplate/router/guards/un_auth_guard.dart';
import 'package:flutter_arch_boilerplate/screens/login_screen.dart';
import 'package:flutter_arch_boilerplate/screens/main_screen.dart';
import 'package:flutter_arch_boilerplate/screens/register_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      page: LoginScreen,
      path: '/login',
      guards: [
        UnAuthGuard,
      ],
    ),
    AutoRoute(
      page: RegisterScreen,
      path: '/register',
      guards: [
        UnAuthGuard,
      ],
    ),
    AutoRoute(
      page: MainScreen,
      path: '/main',
      guards: [
        AuthGuard,
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter({
    required AuthGuard authGuard,
    required UnAuthGuard unAuthGuard,
  }) : super(
          authGuard: authGuard,
          unAuthGuard: unAuthGuard,
        );
}