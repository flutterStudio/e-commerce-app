import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/main_screen_item.model.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ProductListcontroller extends GetxController {
  final int? type;
  Rx<Data<List<Product>>> products = Rx<Data<List<Product>>>(Data.empty());

  ProductListcontroller({this.type});

  Future<void> getCompanyProducts() async {
    products.value = Data.inProgress();
    Data<List<Product>> companyProducts =
        await Get.find<MainRepo>().productRepo.getCompanyProducts();

    products.value = companyProducts;
  }

  Future<void> getOfferProducts(int offer) async {
    products.value = Data.inProgress();
    Data<ScreenItem> screenItem =
        await Get.find<MainRepo>().offerRepo.getScreenItem(offer);
    if (screenItem.status == DataStatus.succeed &&
        screenItem.data?.productScreenItems != null) {
      products.value = Data.succeed(data: screenItem.data!.productScreenItems!);
    }

    products.value.copyProperties(screenItem);
  }
}
