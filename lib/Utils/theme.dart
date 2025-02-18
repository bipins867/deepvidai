import 'package:flutter/material.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF000000), // Pure black background
    primaryColor: Color(0xFF262626), // Instagram-like dark gray
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF000000),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: Color.fromARGB(
          255, 129, 13, 133), // Instagram pinkish-red for highlights
      secondary: Color(0xFF5851DB), // DeepVid AI accent color
      surface: Color(0xFF121212),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white70,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      displayMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white70),
      displaySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white70),
      headlineLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      headlineMedium: TextStyle(
          fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white70),
      headlineSmall: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white60),
      titleLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),
      titleMedium: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white70),
      titleSmall: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white60),
      bodyLarge: TextStyle(
          fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white70),
      bodyMedium: TextStyle(
          fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white60),
      labelLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFE1306C)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFFE1306C), // Instagram highlight color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    iconTheme: IconThemeData(color: Colors.white70),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF121212), // Input field background
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Color(0xFFE1306C)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Color(0xFF5851DB)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Color(0xFFE1306C)),
      ),
      hintStyle: TextStyle(color: Colors.white60),
      labelStyle: TextStyle(color: Colors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF000000),
      selectedItemColor: Color(0xFFE1306C),
      unselectedItemColor: Color(0xFFB3B3B3),
    ),
  );
}
