import 'package:e_commerce/src/dto/add_category.dto.dart';
import 'package:e_commerce/src/model/category.model.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddCategoryController extends GetxController {
  RxString category = RxString("");
  Rx<Data<Category>> addedCategory = Rx<Data<Category>>(Data.empty());
  final MainRepo _mainRepo = Get.find<MainRepo>();

  Future<void> addCategoy() async {
    addedCategory.value = Data.inProgress(
        message: "posting-item".trParams({"item": "categor".tr}));
    _mainRepo.productRepo.postCategory(AddCategoryDTO(title: category.value));
  }
}
