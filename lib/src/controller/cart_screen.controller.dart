import 'package:e_commerce/src/model/cart_item.model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class CartScreenController extends GetxController {
  Rx<List<CartItem>> items = Rx<List<CartItem>>([]);

  void add(int id) {
    CartItem item =
        items.value.firstWhere((element) => element.product.id == id);
    item.count++;
    update();
  }

  void remove(int id) {
    CartItem item =
        items.value.firstWhere((element) => element.product.id == id);
    if (item.count > 0) item.count--;
    if (item.count == 0) {
      items.value.removeWhere((element) => element.product.id == id);
    }
    update();
  }
}
