import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class Discovercontroller extends GetxController {
  Rx<Data<List<Product>>> products = Rx<Data<List<Product>>>(Data.empty());

  Future<void> getProducts() async {
    products.value = Data.inProgress();
    Data<List<Product>> companyProducts =
        await Get.find<MainRepo>().productRepo.getActiveProducts();

    products.value = companyProducts;
  }
}
