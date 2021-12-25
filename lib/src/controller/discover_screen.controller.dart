import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Discovercontroller extends GetxController {
  Rx<Data<List<Product>>> products = Rx<Data<List<Product>>>(Data.empty());

  Future<void> getProducts({int? page, int? pageSize}) async {
    if (page == null) {
      products.value = Data.inProgress();
    }
    Data<List<Product>> companyProducts =
        await Get.find<MainRepo>().productRepo.getActiveProducts(page: page);

    if (page == null) {
      products.value = companyProducts;
      refreshController.refreshCompleted();
    } else {
      products.value.copyProperties(companyProducts);
      products.value.data?.addAll(companyProducts.data ?? []);
      refreshController.loadComplete();
    }
  }

  RefreshController refreshController = RefreshController();
}
