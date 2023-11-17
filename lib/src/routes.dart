import 'package:demo_provider_mvvm/src/common/screens/not_found.dart';
import 'package:demo_provider_mvvm/src/modules/home/view/home_screen.dart';
import 'package:demo_provider_mvvm/src/modules/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case '/profile':
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return const NotFoundScreen();
          },
        );
    }
  }
}
