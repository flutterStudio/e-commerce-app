import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CMSProductsController extends GetxController {
  int? type;
  Rx<int?> offer = Rx<int?>(null);
  Rx<Data<List<Product>>> products = Rx<Data<List<Product>>>(Data.empty());

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  RefreshController refreshController = RefreshController();

  CMSProductsController({this.type});

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
      products.update((val) {
        val?.data?.addAll(companyProducts.data ?? []);
      });
      refreshController.loadComplete();
    }
  }

  Future<void> addProduct() async {
    products.value = Data.inProgress();
    Data<List<Product>> companyProducts =
        await Get.find<MainRepo>().productRepo.getActiveProducts();

    products.value = companyProducts;
  }

  Future<void> deleteProduct(int id) async {
    Data.inProgress(
        showSnackbar: true,
        message: "deleting-item".trParams({"item": "product"}));
    Data<bool> deletedProduct =
        await Get.find<MainRepo>().productRepo.deleteProduct(id);
    if (deletedProduct.isSucceed) {
      products.update((val) {
        val?.data?.removeWhere((element) => element.id == id);
      });
    }
  }
}
