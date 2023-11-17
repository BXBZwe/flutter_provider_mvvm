import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color fuschia = Color(0xFFED4B9E);
  static const Color iris = Color(0xFF4B4DED);
  static const Color peach = Color(0xFFF3D9DA);
  static const Color onyx = Color(0xFF0E0E2C);
  static const Color evergreen = Color(0xFFED4B9E);
  static const Color slate = Color(0xFF4A4A68);
  static const Color lightSlate = Color(0xFF8C8CA1);
  static const Color dorian = Color(0xFFECF1F4);
  static const Color cloud = Color(0xFFFAFCFE);

// Theme
  static ThemeData get light {
    return ThemeData(
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
        foregroundColor: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: fuschia,
      splashColor: Colors.transparent,
      colorScheme: ColorScheme.fromSeed(
        seedColor: fuschia,
        primary: fuschia,
        secondary: Colors.black,
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.black,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.black,
        foregroundColor: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.white,
      splashColor: Colors.transparent,
      colorScheme: ColorScheme.fromSeed(
        seedColor: fuschia,
        primary: fuschia,
        secondary: Colors.white,
        brightness: Brightness.dark,
      ),
    );
  }

  // Theme
  static final ThemeData themeData = ThemeData(
    // Primary and accent colors
    primaryColor: fuschia,
    hintColor: iris,

    // Text themes
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: onyx), // Headings
      bodyLarge: TextStyle(color: slate), // Body text
      bodyMedium: TextStyle(color: lightSlate), // Helper text
      bodySmall: TextStyle(color: lightSlate), // Deemphasized text
    ),

    // Button themes
    buttonTheme: const ButtonThemeData(
      buttonColor: fuschia, // CTAs
      disabledColor: dorian, // Disabled buttons
    ),

    // Input decoration themes
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: iris), // Focused/Active states
      ),
    ),

    // Dialog themes
    dialogTheme: const DialogTheme(
      backgroundColor: cloud, // Light mode Dialogs/alerts
    ),
  );
}
