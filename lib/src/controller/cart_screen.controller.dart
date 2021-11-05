import 'package:e_commerce/src/model/cart_item.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
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

  void add(int id, int count) {
    CartItem item = items.value.firstWhere(
        (element) => element.product.id == id,
        orElse: () => CartItem(
            product: _mainRepo!.productRepo.demoProducts
                .firstWhere((element) => element.id == id),
            count: 0));
    item.count += count;
    items.value.removeWhere((element) => element.product.id == id);
    items.value.add(item);
    calculateTotal();
  }

  void calculateTotal() {
    double total = 0;
    for (CartItem item in items.value) {
      total += item.product.price ?? 0.0 * item.count;
    }
    this.total.value = total;
    update();
  }

  void remove(int id, int count) {
    CartItem item =
        items.value.firstWhere((element) => element.product.id == id);
    if (item.count - count > 0) item.count - count;
    if (item.count == 0) {
      items.value.removeWhere((element) => element.product.id == id);
    }
    items.value.removeWhere((element) => element.product.id == id);
    items.value.add(item);
  }
}
