import 'package:flutter/cupertino.dart';

import 'pages/home.dart';
import 'pages/settings.dart';

class AppRoute {
  const AppRoute({
    this.routeName,
    this.appState,
    this.buildRoute,
  });

  final String routeName;
  final String appState;
  final WidgetBuilder buildRoute;

  @override
  String toString() {
    return '$runtimeType($routeName)';
  }
}

List<AppRoute> _buildAppRoutes() {
  final results = <AppRoute>[
    AppRoute(
      routeName: HomeRoute.routeName,
      buildRoute: (BuildContext context) => HomeRoute(),
    ),
    AppRoute(
      routeName: SettingsRoute.routeName,
      buildRoute: (BuildContext context) => SettingsRoute(),
    ),
  ];
  return results;
}

final List<AppRoute> _appRoutes = _buildAppRoutes();

Map<String, WidgetBuilder> appRoutes() {
  return {
    for (var item in _appRoutes) item.routeName.toString(): item.buildRoute
  };
}
