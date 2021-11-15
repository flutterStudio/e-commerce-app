import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final int? id;
  Rx<Product?> product = Rx<Product?>(null);
  Rx<int> count = Rx<int>(0);
  Rx<double> price = Rx<double>(0);

  ProductController(this.id);

  @override
  void onInit() {
    Get.find<MainRepo>()
        .productRepo
        .getProduct(id!)
        .then((value) => product.value = value.data);

    super.onInit();
  }

  void increaseCount() {
    count.value++;
    calculatePrice();
    update();
  }

  void decreaseCount() {
    if (count.value > 0) count.value--;
    calculatePrice();
    update();
  }

  void calculatePrice() {
    var p = (product.value?.price) ?? 0.0 * count.value.toDouble();
    price.value = p;
  }

  void addToCart() {
    if (count.value > 0) {
      // Get.find<CartScreenController>()
      //     .add(product!.value!.id ?? 0, count!.value);
      // Get.toNamed("/cart");
    }
  }
}
