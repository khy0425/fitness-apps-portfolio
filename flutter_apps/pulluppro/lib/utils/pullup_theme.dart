import 'package:flutter/material.dart';

class PullupTheme {
  // Pull-up Pro 전용 색상 팔레트
  static const Color primaryColor = Color(0xFF3498DB);
  static const Color secondaryColor = Color(0xFF34495E);
  static const Color backgroundColor = Color(0xFF1A1A1A);
  static const Color surfaceColor = Color(0xFF2A2A2A);

  static ThemeData get themeData => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,

    appBarTheme: AppBarTheme(
      backgroundColor: surfaceColor,
      foregroundColor: primaryColor,
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.black,
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),

    cardTheme: CardTheme(
      color: surfaceColor,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
