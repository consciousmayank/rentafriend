 
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF2196F3);
  static const Color primaryLight = Color(0xFF64B5F6);
  static const Color primaryDark = Color(0xFF1976D2);

  // Secondary Colors
  static const Color secondary = Color(0xFF4CAF50);
  static const Color secondaryLight = Color(0xFF81C784);
  static const Color secondaryDark = Color(0xFF388E3C);

  // Background Colors
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF121212);

  // Surface Colors
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E1E1E);

  // Error Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color errorLight = Color(0xFFEF5350);
  static const Color errorDark = Color(0xFFC62828);

  // Text Colors
  static const Color textPrimaryLight = Color(0xFF000000);
  static const Color textSecondaryLight = Color(0xFF757575);
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFB3B3B3);
}

class AppTextStyles {
  static const String _fontFamily = 'Roboto';

  static TextStyle get heading1 => const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontFamily: _fontFamily,
        letterSpacing: -1.5,
      );

  static TextStyle get heading2 => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: _fontFamily,
        letterSpacing: -0.5,
      );

  static TextStyle get subtitle1 => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamily,
        letterSpacing: 0.15,
      );

  static TextStyle get body1 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        fontFamily: _fontFamily,
        letterSpacing: 0.5,
      );

  static TextStyle get body2 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        fontFamily: _fontFamily,
        letterSpacing: 0.25,
      );

  static TextStyle get button => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamily,
        letterSpacing: 1.25,
      );

  static TextStyle get caption => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        fontFamily: _fontFamily,
        letterSpacing: 0.4,
      );
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.error,
        background: AppColors.backgroundLight,
        surface: AppColors.surfaceLight,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.heading1.copyWith(color: AppColors.textPrimaryLight),
        displayMedium: AppTextStyles.heading2.copyWith(color: AppColors.textPrimaryLight),
        titleLarge: AppTextStyles.subtitle1.copyWith(color: AppColors.textPrimaryLight),
        bodyLarge: AppTextStyles.body1.copyWith(color: AppColors.textPrimaryLight),
        bodyMedium: AppTextStyles.body2.copyWith(color: AppColors.textPrimaryLight),
        labelLarge: AppTextStyles.button.copyWith(color: AppColors.textPrimaryLight),
        bodySmall: AppTextStyles.caption.copyWith(color: AppColors.textSecondaryLight),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: AppColors.primary,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: AppTextStyles.heading2.copyWith(color: Colors.white),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        buttonColor: AppColors.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          textStyle: AppTextStyles.button,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.error,
        background: AppColors.backgroundDark,
        surface: AppColors.surfaceDark,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.heading1.copyWith(color: AppColors.textPrimaryDark),
        displayMedium: AppTextStyles.heading2.copyWith(color: AppColors.textPrimaryDark),
        titleLarge: AppTextStyles.subtitle1.copyWith(color: AppColors.textPrimaryDark),
        bodyLarge: AppTextStyles.body1.copyWith(color: AppColors.textPrimaryDark),
        bodyMedium: AppTextStyles.body2.copyWith(color: AppColors.textPrimaryDark),
        labelLarge: AppTextStyles.button.copyWith(color: AppColors.textPrimaryDark),
        bodySmall: AppTextStyles.caption.copyWith(color: AppColors.textSecondaryDark),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: AppColors.surfaceDark,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: AppTextStyles.heading2.copyWith(color: Colors.white),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        buttonColor: AppColors.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          textStyle: AppTextStyles.button,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}