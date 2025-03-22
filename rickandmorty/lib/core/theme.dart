import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(backgroundColor: Colors.white, elevation: 0),
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(),
  );

  static const Color color1 = Color(0xFF42B4CA);
  static const Color color2 = Color(0xFFD5E9ED);
  static const Color color3 = Color(0xFF414A4C);
  static const Color color4 = Color(0xFFEA7979);
  static const Color color5 = Color(0xFFB5C4C7);
}
