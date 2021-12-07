import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppColors {
  static const Color darkGrey = Color(0xFF212121);
  static const Color lightGrey = Color(0x11212121);
  static const Color orange = Color(0xFFFF7643);
  static const Color redOrange = Color(0xFFFF0043);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightOrange = Color(0xFFFFECDF);

  static const CustomColorScheme darkColorScheme = CustomColorScheme(
    primary: darkGrey,
    brightness: Brightness.dark,
    primaryVariant: lightGrey,
    secondaryVariant: orange,
    secondary: orange,
    background: darkGrey,
    error: redOrange,
    onBackground: white,
    onError: darkGrey,
    onPrimary: white,
    onSecondary: white,
    surface: darkGrey,
    onSurface: white,
    icon: white,
    activeIcon: white,
    inactiveIcon: white,
  );

  static const CustomColorScheme lightColorScheme = CustomColorScheme(
    primary: orange,
    brightness: Brightness.light,
    primaryVariant: lightOrange,
    secondaryVariant: lightGrey,
    secondary: darkGrey,
    background: white,
    error: redOrange,
    onBackground: darkGrey,
    onError: white,
    onPrimary: white,
    onSecondary: lightGrey,
    surface: white,
    onSurface: darkGrey,
    icon: darkGrey,
    activeIcon: orange,
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
