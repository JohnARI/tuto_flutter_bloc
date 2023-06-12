import 'package:flutter/material.dart';
import 'package:tuto_flutter_bloc/shared/colors.dart';

enum AppTheme {
  lightGreen,
  darkGreen,
  lightBlue,
  darkBlue,
  lightPink,
  darkPink,
}

extension AppThemeExtension on AppTheme {
  static ThemeData _createThemeData(Brightness brightness, Color primaryColor) {
    return ThemeData(
      brightness: brightness,
      primaryColor: primaryColor,
      useMaterial3: true,
      // Ajouter les autres propriétés ici
    );
  }

  ThemeData get themeData {
    switch (this) {
      case AppTheme.lightGreen:
        return _createThemeData(
          Brightness.light,
          ColorConstant.lightGreenPrimaryColor,
        );
      case AppTheme.darkGreen:
        return _createThemeData(
          Brightness.dark,
          ColorConstant.darkGreenPrimaryColor,
        );
      case AppTheme.lightBlue:
        return _createThemeData(
          Brightness.light,
          ColorConstant.lightBluePrimaryColor,
        );
      case AppTheme.darkBlue:
        return _createThemeData(
          Brightness.dark,
          ColorConstant.darkBluePrimaryColor,
        );
      case AppTheme.lightPink:
        return _createThemeData(
          Brightness.light,
          ColorConstant.lightPinkPrimaryColor,
        );
      case AppTheme.darkPink:
        return _createThemeData(
          Brightness.dark,
          ColorConstant.darkPinkPrimaryColor,
        );
      default:
        return _createThemeData(
          Brightness.light,
          ColorConstant.lightGreenPrimaryColor,
        );
    }
  }
}
