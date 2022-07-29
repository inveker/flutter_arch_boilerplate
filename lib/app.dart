import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch_boilerplate/bloc/theme/theme_bloc.dart';
import 'package:flutter_arch_boilerplate/styles/app_theme.dart';
import 'package:flutter_arch_boilerplate/utils/string_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_arch_boilerplate/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_arch_boilerplate/bloc/localization/localization_bloc.dart';
import 'package:flutter_arch_boilerplate/router/app_router.dart';
import 'package:flutter_arch_boilerplate/router/app_router_observer.dart';
import 'package:flutter_arch_boilerplate/router/guards/auth_guard.dart';
import 'package:flutter_arch_boilerplate/router/guards/un_auth_guard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _appRouter;
  late final LocalizationBloc _localizationBloc;
  late final AuthenticationBloc _authenticationBloc;
  late final ThemeBloc _themeBloc;

  @override
  void initState() {
    _localizationBloc = LocalizationBloc(
      languageCode: Intl.getCurrentLocale(),
    );
    _authenticationBloc = AuthenticationBloc();
    _themeBloc = ThemeBloc(
      brightness: Brightness.light,
    );
    _appRouter = AppRouter(
      authGuard: AuthGuard(
        authenticationBloc: _authenticationBloc,
      ),
      unAuthGuard: UnAuthGuard(
        authenticationBloc: _authenticationBloc,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _localizationBloc,
        ),
        BlocProvider.value(
          value: _authenticationBloc,
        ),
        BlocProvider.value(
          value: _themeBloc,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthenticationBloc, AuthenticationState>(
            listenWhen: (p, n) => p.authentication != n.authentication,
            listener: (context, state) {
              if (state.authentication != null) {
                _appRouter.push(MainRoute());
              } else {
                _appRouter.push(LoginRoute());
              }
            },
          ),
        ],
        child: Builder(
          builder: (context) {
            final languageCode = context.select<LocalizationBloc, String>((bloc) => bloc.state.languageCode);
            final brightness = context.select<ThemeBloc, String>((bloc) => bloc.state.brightness);
            return MaterialApp.router(
              routeInformationParser: _appRouter.defaultRouteParser(),
              routerDelegate: AutoRouterDelegate(
                _appRouter,
                navigatorObservers: () => [AppRouterObserver()],
              ),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale(languageCode),
              theme: AppTheme.build(brightness.toBrightness()),
            );
          },
        ),
      ),
    );
  }
}
