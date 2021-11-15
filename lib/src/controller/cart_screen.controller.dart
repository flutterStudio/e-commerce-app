import 'package:e_commerce/src/model/cart.model.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:e_commerce/src/utils/network.utils.dart';
import 'package:e_commerce/src/view/shared/action.dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartScreenController extends GetxController {
  Rx<Data<Cart>> cart = Rx<Data<Cart>>(Data.empty());
  Rx<double> total = Rx<double>(0.0);
  Rx<Data<bool>> deleteProduct = Rx<Data<bool>>(Data.empty());
  MainRepo? _mainRepo;
  @override
  void onInit() {
    _mainRepo = Get.find<MainRepo>();
    getCart();
    super.onInit();
  }

  void add(int id, int count) async {
    cart.value = Data.inProgress();
    cart.value =
        await _mainRepo?.productRepo.addToCart(id, count) ?? Data.empty();
  }

  Future<void> getCart() async {
    cart.value = Data.inProgress();
    cart.value = await _mainRepo?.productRepo.getMyCart() ?? Data.empty();
  }

  void checkout() {
    NetworkUtils.openwhatsapp(
        "Customer ordered ${cart.value.data?.orderProducts?.length} products with a total price ${total.value}");
  }

  Future<bool> remove(int id) async {
    if (!await Get.dialog(ActionDialog(
      title: "question-delete-cart-product".tr,
    ))) {
      return false;
    }
    deleteProduct.value = Data.inProgress();

    deleteProduct.value =
        await _mainRepo?.productRepo.deleteProductfromcart(id) ?? Data.empty();
    if (deleteProduct.value.status == DataStatus.succeed) {
      cart.value.data?.orderProducts
          ?.removeWhere((element) => element.orderProductId == id);
      return true;
    }
    return false;
  }
}
