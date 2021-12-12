import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/main_screen_item.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:e_commerce/src/view/shared/file_uploader/file_uploader.controller.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CMSOfferScreenCopntroller extends GetxController {
  Rx<Data<List<ScreenItem>>> screenItems =
      Rx<Data<List<ScreenItem>>>(Data.empty());

  FileUploaderController fileUploaderController = FileUploaderController();

  Rx<ScreenItemActionType> offerActionType = Rx(ScreenItemActionType.Internal);
  Rx<ScreenItemtype> offerType = Rx(ScreenItemtype.Item);
  CMSOfferScreenCopntroller() {
    getMainScreenItems();
  }

  final MainRepo _mainRepo = Get.find<MainRepo>();

  Future<List<ScreenItem>> getMainScreenItems() async {
    screenItems.value = Data.inProgress();
    Data<List<ScreenItem>> companyProducts =
        await _mainRepo.offerRepo.getAllScreenItems();

    screenItems.value = companyProducts;
    return screenItems.value.data ?? [];
  }
}
