import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math/presentation/utils/colors.dart';
import 'package:math/presentation/utils/text_styles.dart';

class AppThemes {
  const AppThemes._();

  static ThemeData light() {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: const ColorScheme.light(),
      brightness: Brightness.light,
      hintColor: AppColors.white,
      secondaryHeaderColor: AppColors.black,
      iconTheme: IconThemeData(color: AppColors.black, opacity: 0.8),
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.black, opacity: 0.8),
        backgroundColor: AppColors.lightBackground,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0.6,
        shadowColor: AppColors.primary.withOpacity(0.6),
        surfaceTintColor: AppColors.lightBackground,
        titleTextStyle: AppTextStyles.style600.copyWith(
          color: AppColors.black,
          fontSize: 22,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          textStyle: AppTextStyles.style600.copyWith(color: AppColors.black),
          padding: const EdgeInsets.all(12),
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      secondaryHeaderColor: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.white, opacity: 0.8),
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.white, opacity: 0.8),
        backgroundColor: AppColors.darkBackground,
        centerTitle: true,
        surfaceTintColor: AppColors.darkBackground,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        elevation: 0.6,
        shadowColor: AppColors.primary.withOpacity(0.6),
        titleTextStyle: AppTextStyles.style600.copyWith(
          color: AppColors.white,
          fontSize: 22,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.black,
          textStyle: AppTextStyles.style600.copyWith(color: AppColors.white),
          padding: const EdgeInsets.all(12),
        ),
      ),
    );
  }
}
