import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/main_screen_item.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class OfferScreenCopntroller extends GetxController {
  Rx<Data<List<ScreenItem>>> screenItems =
      Rx<Data<List<ScreenItem>>>(Data.empty());
  OfferScreenCopntroller();

  final MainRepo _mainRepo = Get.find<MainRepo>();
  @override
  void onInit() {
    getMainScreenItems();
    super.onInit();
  }

  void getMainScreenItems() async {
    screenItems.value = Data.inProgress();
    Data<List<ScreenItem>> companyProducts =
        await _mainRepo.offerRepo.getAllScreenItems();

    screenItems.value = companyProducts;
  }
}
