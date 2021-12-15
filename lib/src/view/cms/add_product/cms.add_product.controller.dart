import 'package:e_commerce/src/dto/add_product.dto.dart';
import 'package:e_commerce/src/model/color.model.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/model/size.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/view/shared/file_uploader/file_uploader.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CMSAddProductController extends GetxController {
  Rx<List<String>>? errors = Rx([]);
  Rx<Data<Product>> loginStatus = Rx(Data.empty());
  Rx<Data<List<ColorModel>>> availableColors = Rx(Data.empty());
  Rx<Data<List<Size>>> availableSizes = Rx(Data.empty());

  Rx<String?> title = Rx(null);
  Rx<String?> description = Rx(null);
  Rx<int?> minQuantity = Rx(null);
  Rx<int?> availableQuntity = Rx(null);
  Rx<double?> price = Rx(null);
  Rx<double?> discount = Rx(0);
  Rx<Color?> pickedColor = Rx(null);
  Rx<Data<Color>?> upoadedColor = Rx(null);

  Rx<List<ColorModel>>? selectedColors = Rx([]);
  Rx<List<Size>>? selectedSizes = Rx([]);

  FileUploaderController fileUploaderController = FileUploaderController();

  final MainRepo _mainRepo = Get.find<MainRepo>();

  Future<void> getColors() async {
    availableColors.value = Data.inProgress();

    availableColors.value = await _mainRepo.productRepo.getColors();
  }

  void selectColor(ColorModel color) {
    selectedColors?.update((val) {
      selectedColors?.value.addIf(
          selectedColors?.value
                  .firstWhereOrNull((element) => element.id == color.id) ==
              null,
          color);
    });
  }

  void uploadColor(ColorModel color) {
    upoadedColor.value = Data.inProgress();
    _mainRepo.productRepo.postColor(color);
  }

  void unSelectColor(ColorModel color) {
    selectedColors?.update((val) {
      selectedColors?.value.removeWhere((e) => e.id == color.id);
    });
  }

  bool iscolorSelected(ColorModel color) {
    return selectedColors?.value.firstWhereOrNull((e) => color.id == e.id) ==
            null
        ? false
        : true;
  }

  // Sizes list logic
  Future<void> getSizes() async {
    availableSizes.value = Data.inProgress();

    availableSizes.value = await _mainRepo.productRepo.getSizes();
  }

  void selectSize(Size size) {
    selectedSizes?.update((val) {
      selectedSizes?.value.addIf(
          selectedSizes?.value
                  .firstWhereOrNull((element) => element.id == size.id) ==
              null,
          size);
    });
  }

  void unSelectSize(Size size) {
    selectedSizes?.update((val) {
      selectedSizes?.value.removeWhere((e) => e.id == size.id);
    });
  }

  bool isSizeSelected(Size size) {
    return selectedSizes?.value.firstWhereOrNull((e) => size.id == e.id) == null
        ? false
        : true;
  }

  // files upload.

  Future<void> addProduct() async {
    loginStatus.value = Data.inProgress()..showSnakbar = true;
    loginStatus.value = await _mainRepo.productRepo.postProduct(AddProductDto(
        availableQuantity: availableQuntity.value,
        title: title.value,
        colors: selectedColors?.value ?? [],
        description: description.value,
        images: await fileUploaderController.getAttachments(),
        minQuantity: minQuantity.value,
        price: price.value,
        sizes: selectedSizes?.value ?? []));

    Get.closeCurrentSnackbar();
    if (loginStatus.value.isSucceed) {
      Utils.showSnackBar(
        "message-product-added-successfully".tr,
        background: Get.theme.colorScheme.primaryVariant,
        color: Get.theme.colorScheme.primary,
      );
      // clearAll();
    }
  }

  void clearAll() {
    selectedSizes?.value = [];
    selectedColors?.value = [];
    title.value = null;
    description.value = null;
    minQuantity.value = null;
    discount.value = null;
    availableQuntity.value = null;
    price.value = null;
    fileUploaderController.clearAll();
  }
}
