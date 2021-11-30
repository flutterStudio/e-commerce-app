import 'package:e_commerce/src/dto/add_evaluation.dto.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/model/evaluation.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:e_commerce/src/repository/product.repo.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final int? id;
  Rx<Product?> product = Rx<Product?>(null);
  Rx<Data<List<Evaluation>>> productEvaluations =
      Rx<Data<List<Evaluation>>>(Data.empty());
  Rx<Data<Evaluation>> userEvaluations = Rx<Data<Evaluation>>(Data.empty());
  Rx<int> count = Rx<int>(0);
  Rx<String?> comment = Rx<String?>(null);
  Rx<double> rate = Rx<double>(0);
  Rx<double> price = Rx<double>(0);

  ProductController(this.id);
  final ProductRepo _productRepo = Get.find<MainRepo>().productRepo;
  @override
  void onInit() {
    _productRepo.getProduct(id!).then((value) => product.value = value.data);

    super.onInit();
  }

  ///
  /// #### Brief
  ///   * Get users evaluations on the current product.
  ///   * Updates the value of the observable 'productEvaluations'.
  ///
  void getProductEvaluations() async {
    if (product.value != null) {
      productEvaluations.value = Data.inProgress();
      productEvaluations.value =
          await _productRepo.getProductEvaluations(product.value!.id!);
    }
  }

  ///
  /// #### Brief
  ///   * Post the evaluation of the current user on the `product`.
  ///   * Updates the value of the observable 'userEvaluations'.
  ///
  void evaluateProduct() async {
    if (product.value != null && !comment.isBlank! && !rate.isBlank!) {
      userEvaluations.value = Data.inProgress();
      await _productRepo.addProductEvaluations(AddEvaluationDto(
          comment: comment.value,
          productId: product.value?.id,
          rate: rate.value));
    }
  }

  void increaseCount() {
    count.value++;
    calculatePrice();
    update();
  }

  void decreaseCount() {
    if (count.value > 0) count.value--;
    calculatePrice();
    update();
  }

  void calculatePrice() {
    var p = (product.value?.price) ?? 0.0 * count.value.toDouble();
    price.value = p;
  }

  void addToCart() {
    if (count.value > 0) {
      Get.toNamed("/cart/${product.value?.id}/${count.value}");
    }
  }
}
