import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/dto/add_product.dto.dart';
import 'package:e_commerce/src/dto/update_product.dto.dart';
import 'package:e_commerce/src/model/category.model.dart';
import 'package:e_commerce/src/model/color.model.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/model/size.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:e_commerce/src/view/shared/file_uploader/file_uploader.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CMSAddProductController extends GetxController {
  Rx<bool> productUpdate = Rx(false);
  int? productId;
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

  void fillfields(Product productToUpdate) {
    clearAll();
    titleController.text = productToUpdate.title ?? "";
    descritionController.text = productToUpdate.description ?? "";
    discountController.text = productToUpdate.discount?.toString() ?? "";
    priceController.text = productToUpdate.price?.toString() ?? "";
    availableQuntityController.text =
        productToUpdate.availableQuantity?.toString() ?? "";
    minQuantityController.text = productToUpdate.minQuantity?.toString() ?? "";
    selectedColors?.value.addAll(productToUpdate.colors ?? []);
    selectedSizes?.value.addAll(productToUpdate.sizes ?? []);
    productId = productToUpdate.id;
    productUpdate.value = true;
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
    product.value = Data.inProgress(
        showSnackbar: true,
        message: "posting-item".trParams({"item": "product".tr}));
    product.value = await _mainRepo.productRepo.postProduct(AddProductDto(
        availableQuantity: int.tryParse(availableQuntityController.value.text),
        title: titleController.value.text,
        colors: selectedColors?.value ?? [],
        description: descritionController.value.text,
        discount: double.tryParse(discountController.value.text),
        images: await fileUploaderController.getAttachments(),
        minQuantity: int.tryParse(minQuantityController.value.text),
        price: double.tryParse(priceController.value.text),
        sizes: selectedSizes?.value ?? []));

    clearAll();
  }

  Future<void> updateProduct() async {
    if (productId != null) {
      product.value = Data.inProgress(
          showSnackbar: true,
          message: "updating-item".trParams({"item": "product".tr}));
      product.value = await _mainRepo.productRepo.updateProduct(
          UpdateProductDto(
              availableQuantity:
                  int.tryParse(availableQuntityController.value.text),
              title: titleController.value.text,
              id: productId,
              colors: selectedColors?.value ?? [],
              discount: double.tryParse(discountController.value.text),
              description: descritionController.value.text,
              // images: await fileUploaderController.getAttachments(),
              minQuantity: int.tryParse(minQuantityController.value.text),
              price: double.tryParse(priceController.value.text),
              sizes: selectedSizes?.value ?? []));

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
    product.value = Data.empty();
    productUpdate.value = false;
  }
}
