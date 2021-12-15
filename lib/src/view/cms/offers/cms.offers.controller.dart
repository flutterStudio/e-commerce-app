import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/config/routing/app_paths.dart';
import 'package:e_commerce/src/dto/screen%20_item.dto.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/main_screen_item.model.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:e_commerce/src/view/shared/file_uploader/file_uploader.controller.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CMSOfferScreenCopntroller extends GetxController {
  Rx<Data<List<ScreenItem>>> screenItems =
      Rx<Data<List<ScreenItem>>>(Data.empty());

  FileUploaderController fileUploaderController = FileUploaderController();
  Rx<List<String>> errors = Rx([]);
  Rx<ScreenItemActionType> offerActionType = Rx(ScreenItemActionType.Internal);
  Rx<ScreenItemtype> offerType = Rx(ScreenItemtype.Item);
  RxString offerLink = RxString("");

  RxList<Product> pickedProducts = RxList([]);

  Rx<Data<ScreenItem>> offer = Rx(Data.empty()..showSnakbar = true);
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

  Future<void> pickProducts() async {
    pickedProducts.value =
        (await Get.toNamed(AppPaths.admin + AppPaths.pickProducts)
            as RxList<Product>);
  }

  Future<void> addOffer() async {
    errors.value.clear();

    if (fileUploaderController.files.value.isEmpty) {
      errors.update((val) {
        val?.add("message-error-no-offer-image".tr);
      });
    }
    var attachments = await fileUploaderController.getAttachments();
    if (attachments.isEmpty) {
      errors.update((val) {
        val?.add("message-error-offer-image-not-uploaded".tr);
      });
    }
    if (offerActionType.value == ScreenItemActionType.Internal &&
        pickedProducts.isEmpty) {
      errors.update((val) {
        val?.add("message-error-offer-no-products".tr);
      });
    }

    if (errors.value.isNotEmpty) {
      return;
    }
    offer.value.inProgress();
    ScreenItemDTO dto = offerActionType.value == ScreenItemActionType.External
        ? ScreenItemDTO.external(
            offerType.value.toString().split(".").last, offerLink.value, "", 1)
        : ScreenItemDTO.internal(offerType.value.toString().split(".").last,
            pickedProducts, "image id", 2);
    offer.value = await _mainRepo.offerRepo.postSCreenItem(dto)
      ..showSnakbar = true;
  }
}
