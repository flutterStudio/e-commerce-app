import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeScreenController extends GetxController {
  Rx<int> currentIndex = 0.obs;
  final PersistentTabController _pageController =
      PersistentTabController(initialIndex: 0);

  PersistentTabController get pageController => _pageController;
  HomeScreenController({int? page}) {
    if (page == null) {
      return;
    }
    goToPage(page);
  }

  void goToPage(int page) {
    if (currentIndex.value != page) {
      currentIndex.value = page;
      _pageController.jumpToTab(page);
    }
  }
}
