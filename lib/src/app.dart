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
        ChangeNotifierProvider(create: (_) => ThemeManager()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      builder: (context, child) {
        var authProvider = context.watch<AuthProvider>();
        var themeManager = context.watch<ThemeManager>();

        return FutureBuilder<bool>(
          future: authProvider.checkIsLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: themeManager.themeMode,
                home: const CircularProgressIndicator(),
              );
            }

            String initialRoute = authProvider.isLoggedIn ? '/' : '/login';

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: themeManager.themeMode,
              initialRoute: initialRoute,
              home: initialRoute == '/' ? HomeView() : LoginView(),
            );
          },
        );
      },
    );
  }
}
