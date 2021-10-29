import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/src/config/app.config.dart';
import 'package:flutter_template/src/config/routing/app_routes.dart';
import 'package:flutter_template/src/config/theming/theming.dart';
import 'package:flutter_template/src/config/translations/translations.dart';
import 'package:get/route_manager.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    AppConfig().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppConfig().init();
    return GetMaterialApp(
      getPages: AppRoutes.pages,
      translations: AppTranslations(),
      locale: Get.deviceLocale,
      supportedLocales: AppTranslations().supportedLocales,
      theme: ThemeConfigs.getTheme(),
    );
  }
}
