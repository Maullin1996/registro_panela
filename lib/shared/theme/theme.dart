import 'package:flutter/material.dart';
import 'package:registro_panela/shared/utils/typography.dart';

abstract class AppThemes {
  /// Light theme configuration.
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 153, 209, 255),
    ),
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
