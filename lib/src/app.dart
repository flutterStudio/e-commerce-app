import 'package:e_commerce/src/config/routing/app_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:e_commerce/src/config/routing/app_routes.dart';
import 'package:e_commerce/src/config/theming/theming.dart';
import 'package:e_commerce/src/config/translations/translations.dart';
import 'package:get/route_manager.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoutes.pages,
      translations: AppTranslations(),
      initialRoute: AppPaths.home,
      locale: Get.deviceLocale,
      supportedLocales: AppTranslations().supportedLocales,
      theme: ThemeConfigs.getTheme(themeMode: ThemeMode.light),
      themeMode: ThemeMode.light,
    );
  }
}
