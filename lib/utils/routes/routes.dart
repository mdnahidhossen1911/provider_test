import 'package:flutter/material.dart';
import 'package:provider_test/utils/routes/routes_name.dart';
import 'package:provider_test/view/home_screen.dart';
import 'package:provider_test/view/login_screen.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    late Widget route;

    switch (setting.name) {
      case RoutesName.login:
        route = LoginScreen();
      case RoutesName.home:
        route = HomeScreen();
      default:
        route = Scaffold(body: Center(child: Text('No route defined')));
    }

    return MaterialPageRoute(
      builder: (context) {
        return route;
      },
    );
  }
}
