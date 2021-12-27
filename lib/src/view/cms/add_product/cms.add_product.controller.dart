import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/dto/add_product.dto.dart';
import 'package:e_commerce/src/model/category.model.dart';
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
  Rx<bool> updateProduct = Rx(false);
  // fields controllers

  TextEditingController titleController = TextEditingController();
  TextEditingController descritionController = TextEditingController();
  TextEditingController minQuantityController = TextEditingController();
  TextEditingController availableQuntityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  // Product properties
  Rx<List<String>>? errors = Rx([]);
  Rx<Data<Product>> product = Rx(Data.empty());
  Rx<Data<List<ColorModel>>> availableColors = Rx(Data.empty());
  Rx<Data<List<Size>>> availableSizes = Rx(Data.empty());

  void fillfields(Product product) {
    clearAll();
    titleController.text = product.title ?? "";
    descritionController.text = product.description ?? "";
    discountController.text = product.discount?.toString() ?? "";
    priceController.text = product.price?.toString() ?? "";
    availableQuntityController.text =
        product.availableQuantity?.toString() ?? "";
    minQuantityController.text = product.minQuantity?.toString() ?? "";
    selectedColors?.value.addAll(product.colors ?? []);
    selectedSizes?.value.addAll(product.sizes ?? []);
  }

  Rx<List<ColorModel>>? selectedColors = Rx([]);
  Rx<List<Size>>? selectedSizes = Rx([]);
  Rx<List<Category>>? selectedCategories = Rx([]);

  FileUploaderController fileUploaderController = FileUploaderController()
    ..allowedFileTypes.value = MediaType.image;

  final MainRepo _mainRepo = Get.find<MainRepo>();

  Future<void> getColors() async {
    availableColors.value = Data.inProgress();

    availableColors.value = await _mainRepo.productRepo.getColors();
  }

  Rx<Color?> pickedColor = Rx(null);
  void selectColor(ColorModel color) {
    selectedColors?.update((val) {
      selectedColors?.value.addIf(
          selectedColors?.value
                  .firstWhereOrNull((element) => element.id == color.id) ==
              null,
          color);
    });
  }

  Rx<Data<Color>?> colorToUpload = Rx(null);
  void uploadColor(ColorModel color) {
    colorToUpload.value = Data.inProgress();
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

  Future<void> addProduct() async {
    product.value = Data.inProgress(showSnackbar: true);
    product.value = await _mainRepo.productRepo.postProduct(AddProductDto(
        availableQuantity: int.tryParse(availableQuntityController.value.text),
        title: titleController.value.text,
        colors: selectedColors?.value ?? [],
        description: descritionController.value.text,
        images: await fileUploaderController.getAttachments(),
        minQuantity: int.tryParse(minQuantityController.value.text),
        price: double.tryParse(priceController.value.text),
        sizes: selectedSizes?.value ?? []));

    Get.closeCurrentSnackbar();
    if (product.value.isSucceed) {
      Utils.showSnackBar(
        "message-product-added-successfully".tr,
        background: Get.theme.colorScheme.primaryVariant,
        color: Get.theme.colorScheme.primary,
      );
      clearAll();
    }
  }

  void clearAll() {
    selectedSizes?.value = [];
    selectedColors?.value = [];
    titleController.clear();
    descritionController.clear();
    minQuantityController.clear();
    discountController.clear();
    availableQuntityController.clear();
    priceController.clear();
    fileUploaderController.clearAll();
  }
}
