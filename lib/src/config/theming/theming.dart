import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'app_colors.dart';
import 'text_themes.dart';
export 'app_colors.dart' hide AppColors;
export 'text_themes.dart' hide AppTextTheme, TextStyles;

class ThemeConfigs {
  static final Map<ThemeMode, ColorScheme> _themesColorSchemes = {
    ThemeMode.dark: AppColors.darkColorScheme,
    ThemeMode.light: AppColors.lightColorScheme,
  };
  static void changeTheme() {
    ThemeData theme =
        getTheme(themeMode: Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    Get.changeTheme(theme);
  }

  static ThemeData getTheme({ThemeMode themeMode = ThemeMode.system}) {
    return ThemeData.from(
        colorScheme:
            _themesColorSchemes[themeMode] ?? AppColors.darkColorScheme,
        textTheme: AppTextTheme.getTextTheme(themeMode));
  }
}
