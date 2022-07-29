# flutter_arch_boilerplate

## Platforms

1. Android
2. IOS
3. WEB

## Install

Get dependencies

    flutter pub get

Generate code

    flutter pub run build_runner build

Generate translations

    flutter gen-l10n

Generate splash screen

    flutter pub run flutter_native_splash:create --path=flutter_native_splash.yaml


## Development

Auto generate code

    flutter pub run build_runner watch

Auto generate translations

    * automatically at hotreload *

## Docs

### Dependency documentation

[Bloc](https://bloclibrary.dev/)

[HydratedBloc](https://pub.dev/packages/hydrated_bloc)

[Freezed](https://pub.dev/packages/freezed)

[Routing](https://pub.dev/packages/auto_route)

[Splash screen](https://pub.dev/packages/flutter_native_splash) config ./flutter_native_splash.yaml

[Localization lib intl](https://pub.dev/packages/intl)

[Localization arb files](https://localizely.com/flutter-arb/)


### Main structure

file ./lib/main.dart - entry point. Initialization of all modules necessary for the application.

file ./lib/app.dart - Root widget. Initialization of global blocks, routing, localization, themes and similar components.

folder ./lib/api - Static pure classes, call api. Not use local or global state = PURE.

folder ./lib/bloc - All business logic of the application, separated from widgets. Throw all necessary dependencies during initialization through the constructor

folder ./lib/models - Description of the entities with which the application works. Each in a separate directory so that the generated files do not interfere.

folder ./lib/router - Files responsible for navigation in the application

folder ./lib/screens - Only files, no structure in depth. One screen - one file, if decomposition into layout widgets is needed - use local widgets

folder ./lib/themes - App Themes

folder ./lib/utils - Auxiliary utilities, classes, extensions, everything that cannot be attributed to a specific module

folder ./lib/widgets - Reusable Widgets. Any directory structure

### Localization documentation

Config path = ./l10n.yaml

Localization files path = ./assets/localizations/*

Localization Bloc path = ./lib/bloc/localization

[Localization lib intl](https://pub.dev/packages/intl)

[Localization arb files](https://localizely.com/flutter-arb/)

Get localization from context (import ./lib/utils/build_context_extension.dart)

    context.l10n

Generate command

    flutter gen-l10n

### Bloc documentation

path = ./lib/bloc/*

[Bloc](https://bloclibrary.dev/)

[HydratedBloc](https://pub.dev/packages/hydrated_bloc)

[Freezed](https://pub.dev/packages/freezed)

See other blocs to example

Use freezed package to create states and events

Use HydratedBloc if you want to save the state on the device

Generate command

    flutter pub run build_runner build


### Routing documentation

path = ./lib/router/*

[Routing](https://pub.dev/packages/auto_route)

Generate command

    flutter pub run build_runner build