import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class HomeScreenController extends GetxController {
  Rx<int> counter = 0.obs;

  void increaseCounter() {
    counter.value++;
    update();
  }

  void decreaseCounter() {
    counter.value--;
    update();
  }
}
