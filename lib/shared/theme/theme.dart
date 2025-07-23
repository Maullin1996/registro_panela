import 'package:flutter/material.dart';
import 'package:registro_panela/shared/utils/colors.dart';
import 'package:registro_panela/shared/utils/spacing.dart';
import 'package:registro_panela/shared/utils/typography.dart';

abstract class AppThemes {
  /// Light theme configuration.
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      extendedTextStyle: TextStyle(
        fontFamily: AppTypography.familyRoboto,
        fontSize: AppTypography.h3,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.colorElevatedButton,
        elevation: 5,
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.medium,
          vertical: AppSpacing.small,
        ),
        textStyle: TextStyle(
          fontFamily: AppTypography.familyRoboto,
          fontSize: AppTypography.h3,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.colorScheme),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: AppTypography.familyRoboto,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: AppTypography.h1,
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.normal,
      ),
      headlineMedium: TextStyle(
        fontSize: AppTypography.h2,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.italic,
      ),
      headlineSmall: TextStyle(
        fontSize: AppTypography.h3,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.italic,
      ),
      bodyLarge: TextStyle(
        fontSize: AppTypography.body,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic,
      ),
      bodyMedium: TextStyle(
        fontSize: AppTypography.h4,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic,
      ),
      bodySmall: TextStyle(
        fontSize: AppTypography.h5,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
}
