import 'package:demo_provider_mvvm/src/common/app_config.dart';
import 'package:demo_provider_mvvm/src/common/theme/app_theme.dart';
import 'package:demo_provider_mvvm/src/modules/auth/view/login_screen.dart';
import 'package:demo_provider_mvvm/src/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:demo_provider_mvvm/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeManager()),
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
      ],
      builder: (context, child) {
        var authViewModel = context.watch<AuthViewModel>();

        return FutureBuilder<bool>(
          future: authViewModel.isLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // Determine the initial route based on the login status
              String initialRoute = authViewModel.isLogin ? '/' : '/login';

              if (initialRoute == '/') {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: (settings) =>
                      AppRouter.generateRoute(settings),
                  theme: AppTheme.light,
                  darkTheme: AppTheme.dark,
                  themeMode: context.watch<ThemeManager>().themeMode,
                  initialRoute: initialRoute,
                );
              } else {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.light,
                  darkTheme: AppTheme.dark,
                  themeMode: context.watch<ThemeManager>().themeMode,
                  home: LoginScreen(),
                );
              }
            } else {
              // Show a loading indicator or splash screen while checking the login status
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: context.watch<ThemeManager>().themeMode,
                home: const CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}
