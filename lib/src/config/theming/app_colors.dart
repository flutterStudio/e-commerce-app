import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppColors {
  static const Color darkGrey = Color(0xFF212121);
  static const Color orange = Color(0xFFDD2C00);
  static const Color white = Color(0xFFFFFFFF);

  static const CustomColorScheme darkColorScheme = CustomColorScheme(
    primary: darkGrey,
    brightness: Brightness.light,
    primaryVariant: darkGrey,
    secondaryVariant: orange,
    secondary: orange,
    background: darkGrey,
    error: orange,
    onBackground: white,
    onError: white,
    onPrimary: white,
    onSecondary: white,
    surface: darkGrey,
    onSurface: white,
    icon: white,
    activeIcon: white,
    inactiveIcon: white,
  );
}

class CustomColorScheme extends ColorScheme {
  final Color? icon;
  final Color? activeIcon;
  final Color? inactiveIcon;
  const CustomColorScheme(
      {required Color primary,
      required Brightness brightness,
      required Color primaryVariant,
      required Color secondaryVariant,
      required Color secondary,
      required Color background,
      required Color error,
      required Color onBackground,
      required Color onError,
      required Color onPrimary,
      required Color onSecondary,
      required Color surface,
      required Color onSurface,
      this.activeIcon,
      this.icon,
      this.inactiveIcon})
      : super(
          primary: primary,
          brightness: brightness,
          primaryVariant: primaryVariant,
          secondaryVariant: secondaryVariant,
          secondary: secondary,
          background: background,
          error: error,
          onBackground: onBackground,
          onError: onError,
          onPrimary: onPrimary,
          onSecondary: onSecondary,
          surface: surface,
          onSurface: onSurface,
        );
}
