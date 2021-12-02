import 'package:e_commerce/src/controller/cart_screen.controller.dart';
import 'package:e_commerce/src/dto/add_evaluation.dto.dart';
import 'package:e_commerce/src/model/color.model.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/model/evaluation.model.dart';
import 'package:e_commerce/src/model/size.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:e_commerce/src/repository/product.repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final int? id;
  Rx<Data<Product>> product = Rx<Data<Product>>(Data.empty());

  Rx<Data<List<Evaluation>>> productEvaluations =
      Rx<Data<List<Evaluation>>>(Data.empty());

  Rx<Data<Evaluation>> userEvaluations = Rx<Data<Evaluation>>(Data.empty());

  // Products screen temporary info.

  /// product available amount taking into consideration the selected count.
  Rx<int> availableAmount = Rx<int>(0);

  /// Selected amount of the product.
  Rx<int> count = Rx<int>(0);

  /// Users review comment.
  Rx<String?> comment = Rx<String?>(null);

  /// Users review rate.
  Rx<double> rate = Rx<double>(0);

  /// Products price according to the selected amount.
  Rx<double> price = Rx<double>(0);

  /// Product's selected color.
  Rx<ColorModel?> selectedColor = Rx<ColorModel?>(null);

  /// Product's selected size.
  Rx<Size?> selectedSize = Rx<Size?>(null);

  ProductController(this.id);
  final ProductRepo _productRepo = Get.find<MainRepo>().productRepo;
  @override
  void onInit() {
    if (id != null) {
      getProduct(id!).then((value) => getUserEvaluations());
    }

    super.onInit();
  }

  ///
  /// #### Brief
  ///   * Get users evaluations on the current product.
  ///   * Updates the value of the observable 'productEvaluations'.
  ///
  void getProductEvaluations() async {
    if (product.value.data != null) {
      productEvaluations.value = Data.inProgress();
      productEvaluations.value =
          await _productRepo.getProductEvaluations(product.value.data!.id!);
    }
  }

  void getUserEvaluations() async {
    if (product.value.data != null) {
      userEvaluations.value = Data.inProgress();
      userEvaluations.value =
          await _productRepo.getUserProductEvaluations(product.value.data!.id!);
    }
  }

  ///
  /// #### Brief
  ///   * Post the evaluation of the current user on the `product`.
  ///   * Updates the value of the observable 'userEvaluations'.
  ///
  void evaluateProduct() async {
    if (product.value.data != null && !comment.isBlank! && !rate.isBlank!) {
      userEvaluations.value = Data.inProgress();
      Get.showSnackbar(GetBar(
        snackStyle: SnackStyle.GROUNDED,
        messageText: Text(
          "Sending comment".tr,
          style: Get.textTheme.subtitle2
              ?.copyWith(color: Get.theme.colorScheme.onError),
        ),
        backgroundColor: Get.theme.colorScheme.error,
      ));
      userEvaluations.value = await _productRepo.addProductEvaluations(
          AddEvaluationDto(
              comment: comment.value,
              productId: product.value.data?.id,
              rate: rate.value));
    }
  }

  ///
  /// #### Brief
  ///   * Fetch the product with the given [id].
  ///
  Future<void> getProduct(int id) async {
    product.value = Data.inProgress();
    product.value = await _productRepo.getProduct(id);
    availableAmount.value = product.value.data?.availableQuantity ?? 0;
  }

  void increaseCount() {
    if (count.value < product.value.data!.availableQuantity!) {
      count.value++;
      availableAmount.value--;
      calculatePrice();
    }
  }

  void decreaseCount() {
    if (count.value > 0) {
      count.value--;
      availableAmount.value++;
      calculatePrice();
    }
  }

  void calculatePrice() {
    var p = (product.value.data?.price) ?? 0.0 * count.value.toDouble();
    price.value = p;
  }

  void addToCart() {
    if (count.value > 0) {
      Get.find<CartScreenController>().add(product.value.data!.id!, count.value,
          color: selectedColor.value, size: selectedSize.value);
    } else {
      Get.showSnackbar(GetBar(
        snackStyle: SnackStyle.GROUNDED,
        messageText: Text(
          "no-selected-items".tr,
          style: Get.textTheme.subtitle2
              ?.copyWith(color: Get.theme.colorScheme.onError),
        ),
        backgroundColor: Get.theme.colorScheme.error,
      ));
    }
  }

  ///
  /// #### Brief
  ///   * Change the selected [color] in the product details screen.
  ///
  /// #### parameters
  ///   * [color] the color to be selected.
  ///
  void selectColor(ColorModel color) {
    if (selectedColor.value != color) {
      selectedColor.value = color;
    }
  }

  ///
  /// #### Brief
  ///   * Change the selected [size] in the product details screen.
  ///
  /// #### parameters
  ///   * [size] the size to be selected.
  ///
  void selectSize(Size size) {
    if (selectedSize.value != size) {
      selectedSize.value = size;
    }
  }
}
