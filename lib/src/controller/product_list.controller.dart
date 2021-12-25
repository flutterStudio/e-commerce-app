import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/main_screen_item.model.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ProductListcontroller extends GetxController {
  int? type;
  Rx<int?> offer = Rx<int?>(null);
  Rx<Data<List<Product>>> products = Rx<Data<List<Product>>>(Data.empty());

  ProductListcontroller({this.type});

  ProductListcontroller.offer(int offer) {
    getOfferProducts(offer);
  }

  Future<void> getProducts({int? page, int? pageSize}) async {
    if (page == null) {
      products.value = Data.inProgress();
    }
    Data<List<Product>> companyProducts =
        await Get.find<MainRepo>().productRepo.getActiveProducts(page: page);

    if (page == null) {
      products.value = companyProducts;
    } else {
      products.value.copyProperties(companyProducts);
      products.value.data?.addAll(companyProducts.data ?? []);
    }
  }

  Future<void> getOfferProducts(int offer) async {
    products.value = Data.inProgress();
    Data<ScreenItem> screenItem =
        await Get.find<MainRepo>().offerRepo.getScreenItem(offer);
    if (screenItem.status == DataStatus.succeed &&
        screenItem.data?.productScreenItems != null) {
      products.value = Data.succeed(data: screenItem.data!.productScreenItems!);
    }
  }
}
