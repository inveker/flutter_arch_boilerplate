import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppRouterObserver extends AutoRouterObserver {
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    print('Router init tab: ${previousRoute?.name} -> ${route.name}');
  }
  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    print('Router chnage tab: ${previousRoute.name} -> ${route.name}');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('Router push: ${previousRoute?.settings.name} -> ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('Router pop: ${previousRoute?.settings.name} -> ${route.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('Router remove: ${previousRoute?.settings.name} -> ${route.settings.name}');
  }

  @override
  void didReplace({ Route<dynamic>? newRoute, Route<dynamic>? oldRoute }) {
    print('Router replace: ${oldRoute?.settings.name} -> ${newRoute?.settings.name}');
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('Router start user gesture: ${previousRoute?.settings.name} -> ${route.settings.name}');
  }

  @override
  void didStopUserGesture() {
    print('Router stop user gesture');
  }
}