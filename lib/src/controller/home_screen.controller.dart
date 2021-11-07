import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class HomeScreenController extends GetxController {
  Rx<int> currentIndex = 0.obs;

  void goToPage(int page) {
    currentIndex.value = page;
    update();
  }
}
