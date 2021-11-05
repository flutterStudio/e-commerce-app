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
    // Fake data
    switch (type) {
      case 0:
        {
          products?.value =
              Get.find<MainRepo>().productRepo.demoProducts.sublist(0, 4);
          break;
        }
      case 1:
        {
          products?.value =
              Get.find<MainRepo>().productRepo.demoProducts.sublist(10, 14);
          break;
        }
      case 2:
        {
          products?.value =
              Get.find<MainRepo>().productRepo.demoProducts.sublist(4, 8);
          break;
        }
      case 3:
        {
          products?.value =
              Get.find<MainRepo>().productRepo.demoProducts.sublist(8, 10);
          break;
        }
      default:
        {
          products?.value = Get.find<MainRepo>().productRepo.demoProducts;
        }
    }

    super.onInit();
  }
}
