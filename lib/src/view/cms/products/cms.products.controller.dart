import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class CMSProductsController extends GetxController {
  int? type;
  Rx<int?> offer = Rx<int?>(null);
  Rx<Data<List<Product>>> products = Rx<Data<List<Product>>>(Data.empty());

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  CMSProductsController({this.type});

  Future<void> getProducts() async {
    products.value = Data.inProgress();
    Data<List<Product>> companyProducts =
        await Get.find<MainRepo>().productRepo.getActiveProducts();

    products.value = companyProducts;
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
