import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final int? id;
  Rx<Product?>? product = Rx<Product?>(null);
  Rx<int>? count = Rx<int>(0);

  ProductController(this.id);

  @override
  void onInit() {
    Get.find<MainRepo>()
        .productRepo
        .getProduct(id!)
        .then((value) => product?.value = value.data);

    super.onInit();
  }

  void increaseCount() {
    count?.value++;
    update();
  }

  void decreaseCount() {
    if (count! > 0) count?.value--;
    update();
  }

  void addToCart() {
    if (count! > 0) {
      // Get.find<CartScreenController>()
      //     .add(product!.value!.id ?? 0, count!.value);
      // Get.toNamed("/cart");
    }
  }
}
