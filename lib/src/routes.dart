import 'package:demo_provider_mvvm/src/common/screens/not_found.dart';
//import 'package:demo_provider_mvvm/src/modules/home/home_view.dart';
import 'package:demo_provider_mvvm/src/modules/profile/profile_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/':
      //   return MaterialPageRoute(
      //     builder: (_) => HomeView(),
      //   );
      case '/profile':
        return MaterialPageRoute(
          builder: (_) => ProfileView(),
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
