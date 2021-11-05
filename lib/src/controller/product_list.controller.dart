import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ProductListcontroller extends GetxController {
  final int? type;
  Rx<List<Product?>>? products = Rx<List<Product?>>([]);

  ProductListcontroller(this.type);

  @override
  void onInit() {
    if (type == 0) {
      products?.value = Get.find<MainRepo>().productRepo.demoProducts;
    } else {
      products?.value = Get.find<MainRepo>().productRepo.purses;
    }

    super.onInit();
  }
}
