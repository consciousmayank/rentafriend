import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'text_styles.dart';

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