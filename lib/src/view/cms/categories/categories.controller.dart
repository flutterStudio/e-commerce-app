import 'package:e_commerce/src/dto/add_category.dto.dart';
import 'package:e_commerce/src/model/category.model.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CategoriesController extends GetxController {
  RxString category = RxString("");
  Rx<Data<Category>> addedCategory = Rx<Data<Category>>(Data.empty());
  Rx<Data<List<Category>>> categories = Rx<Data<List<Category>>>(Data.empty());
  RxList<Category> selectedCategories = RxList<Category>([]);

  CategoriesController() : _selectable = true {
    initCategories();
  }
  CategoriesController.selectable() : _selectable = true {
    initCategories();
  }
  final bool _selectable;
  final MainRepo _mainRepo = Get.find<MainRepo>();

  Future<void> addCategoy() async {
    addedCategory.value = Data.inProgress(
        message: "posting-item".trParams({"item": "categor".tr}));
    addedCategory.value = await _mainRepo.productRepo
        .postCategory(AddCategoryDTO(title: category.value));
    if (addedCategory.value.isSucceed) {
      if (addedCategory.value.data != null) {
        categories.update((val) {
          val?.data?.add(addedCategory.value.data!);
        });
      }
    }
  }

  Future<void> initCategories() async {
    categories.value = Data.inProgress();
    categories.value = await _mainRepo.productRepo.getCategories();
  }

  Future<void> selectCategory(Category category) async {
    if (!_selectable) {
      return;
    }
    if (!selectedCategories.contains(category)) {
      selectedCategories.addIf(
          !selectedCategories.contains(category), category);
    } else {
      selectedCategories.removeWhere((e) => e.id == category.id);
    }
  }

  void unSelectCategory(Category category) {
    selectedCategories.removeWhere((e) => e.id == category.id);
  }

  bool isCategorySelected(Category category) {
    return selectedCategories.firstWhereOrNull((e) => category.id == e.id) ==
            null
        ? false
        : true;
  }
}
