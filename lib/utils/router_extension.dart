import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

extension StackRouterExtension on StackRouter {
  Future<T?> pushAndRemoveAll<T extends Object?>(PageRouteInfo route) {
    return pushAndPopUntil(route, predicate: (Route<dynamic> route) => false);
  }
}