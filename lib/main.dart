import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_arch_boilerplate/app.dart';
import 'package:flutter_arch_boilerplate/bloc/app_bloc_observer.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  BlocOverrides.runZoned(
    () => HydratedBlocOverrides.runZoned(
      () => runApp(App()),
      storage: storage,
    ),
    blocObserver: AppBlocObserver(),
  );

  Future(() => FlutterNativeSplash.remove());
}
