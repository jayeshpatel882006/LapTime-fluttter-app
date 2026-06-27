import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color background = Color(0xFF0A0A0F);
  static const Color surface = Color(0xFF141420);
  static const Color surfaceLight = Color(0xFF1E1E2E);
  static const Color surfaceElevated = Color(0xFF252538);
  static const Color cardBackground = Color(0xFF18182A);

  static const Color primary = Color(0xFF5B8DEF);
  static const Color primaryLight = Color(0xFF7AA4FF);
  static const Color secondary = Color(0xFF9B6DFF);
  static const Color success = Color(0xFF4ADE80);
  static const Color warning = Color(0xFFFB923C);
  static const Color reset = Color(0xFFEF4444);
  static const Color resetLight = Color(0xFFFCA5A5);

  static const Color textPrimary = Color(0xFFF1F1F6);
  static const Color textSecondary = Color(0xFF9898B0);
  static const Color textTertiary = Color(0xFF5E5E78);
  static const Color disabled = Color(0xFF3A3A4E);
}

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        onPrimary: Colors.white,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 4,
        ),
      ),
    );
  }
}
