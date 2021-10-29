import '/src/view/home.screen.dart';

import '../routing/app_paths.dart';

import 'package:get/route_manager.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: AppPaths.home,
      page: () => const HomeScreen(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
    ),
  ];
}
