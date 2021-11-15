import 'package:e_commerce/src/model/cart_item.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:e_commerce/src/utils/network.utils.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartScreenController extends GetxController {
  Rx<List<CartItem>> items = Rx<List<CartItem>>([]);
  Rx<double> total = Rx<double>(0.0);
  MainRepo? _mainRepo;
  @override
  void onInit() {
    _mainRepo = Get.find<MainRepo>();

    super.onInit();
  }

  void add(int id, int count) async {
    await _mainRepo?.productRepo.addToCart(id, count);
  }

  void checkout() {
    NetworkUtils.openwhatsapp(
        "Customer ordered ${items.value.length} products with a total price ${total.value}");
  }

  void remove(int id, int count) {}
}
