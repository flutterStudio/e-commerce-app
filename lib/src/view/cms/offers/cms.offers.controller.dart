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

  Rx<Data<ScreenItem>> offer = Rx(Data.empty());
  RxInt offerOrder = RxInt(1);
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
    offer.value = Data.inProgress(showSnackbar: true, message: "Sending offer");
    ScreenItemDTO dto = offerActionType.value == ScreenItemActionType.External
        ? ScreenItemDTO.external(
            offerType.value.toString().split(".").last,
            offerLink.value,
            attachments.first.attachmentId.toString(),
            offerOrder.value)
        : ScreenItemDTO.internal(
            offerType.value.toString().split(".").last,
            pickedProducts,
            attachments.first.attachmentId.toString(),
            offerOrder.value);
    offer.value = await _mainRepo.offerRepo.postSCreenItem(dto);

    // Fetch offers again
    if (offer.value.isSucceed) {
      getMainScreenItems();
    }
  }

  Future<void> deleteOffer(int id) async {
    Data.inProgress(
        showSnackbar: true,
        message: "deleting-item".trParams({"item": "Offer"}));
    var result = await _mainRepo.offerRepo.deleteScreenItem(id);
    if (result.isSucceed) {
      screenItems.update((val) {
        val?.data?.removeWhere((element) => element.screenItemId == id);
      });
    }
  }

  bool isOrderValid(int value) {
    if (value <= 0) {
      return false;
    }
    return screenItems.value.data
            ?.every((element) => element.orderNumber != value) ??
        false;
  }

  void increaseOrder() {
    int order = offerOrder.value + 1;
    while (!isOrderValid(order)) {
      order++;
    }
    offerOrder.value = order;
  }

  void decreaseOrder() {
    int order = offerOrder.value - 1;
    if (order <= 0) {
      return;
    }
    while (!isOrderValid(order)) {
      order--;
      if (order <= 0) {
        break;
      }
    }
    // if (isOrderValid((offerOrder.value + 1).toString()))
    offerOrder.value = order;
  }
}
