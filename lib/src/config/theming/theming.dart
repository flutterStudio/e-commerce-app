import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'app_colors.dart';
import 'text_themes.dart';
export 'app_colors.dart' hide AppColors;
export 'text_themes.dart' hide AppTextTheme, TextStyles;

class ThemeConfigs {
  static final Map<ThemeMode, ColorScheme> _themesColorSchemes = {
    ThemeMode.dark: AppColors.darkColorScheme,
    ThemeMode.light: AppColors.darkColorScheme,
  };
  static ThemeData changeTheme(BuildContext context) {
    return getTheme(theme: Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }

  static ThemeData getTheme({ThemeMode theme = ThemeMode.system}) {
    return ThemeData.from(
        colorScheme: _themesColorSchemes[theme] ?? AppColors.darkColorScheme,
        textTheme: AppTextTheme.getTextTheme(theme));
  }
}
