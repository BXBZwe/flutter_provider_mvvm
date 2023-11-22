import 'package:demo_provider_mvvm/src/common/app_config.dart';
import 'package:demo_provider_mvvm/src/common/theme/app_theme.dart';
import 'package:demo_provider_mvvm/src/modules/home/home_view.dart';
import 'package:demo_provider_mvvm/src/modules/login/login_view.dart';
import 'package:demo_provider_mvvm/src/routes.dart';
import 'package:demo_provider_mvvm/src/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeManager()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        // ChangeNotifierProvider(create: (context) => LoginViewModel()),
        // ChangeNotifierProvider(create: (context) => SignUpViewModel()),
      ],
      builder: (context, child) {
        var authProvider = context.watch<AuthProvider>();

        return FutureBuilder<bool>(
          future: authProvider.checkIsLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // Determine the initial route based on the login status
              String initialRoute = authProvider.isLoggedIn ? '/' : '/login';

              if (initialRoute == '/') {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: (settings) =>
                      AppRouter.generateRoute(settings),
                  theme: AppTheme.light,
                  darkTheme: AppTheme.dark,
                  themeMode: context.watch<ThemeManager>().themeMode,
                  // initialRoute: initialRoute,
                  home: HomeView(),
                );
              } else {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.light,
                  darkTheme: AppTheme.dark,
                  themeMode: context.watch<ThemeManager>().themeMode,
                  home: LoginView(),
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
