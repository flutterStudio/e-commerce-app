import 'package:e_commerce/src/dto/filter_products.dto.dart';
import 'package:e_commerce/src/model/category.model.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:e_commerce/src/repository/product.repo.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final Rx<List<Category>> categories = Rx<List<Category>>([]);
  Rx<Data<List<Product>>> products = Rx<Data<List<Product>>>(Data.empty());
  Rx<Category?> selectedCategory = Rx<Category?>(null);
  Rx<String?> searchTerm = Rx<String?>(null);
  final ProductRepo _productRepo = Get.find<MainRepo>().productRepo;
  SearchController() {
    initCategories();
  }
  SearchController.filter(List<Category> categories);
  SearchController.search(String key);

  Future<void> searchProduct(String key) async {
    searchTerm.value = key;
    products.value = Data.inProgress();
    Data<List<Product>> companyProducts = await Get.find<MainRepo>()
        .productRepo
        .searchProducts(searchTerm.value!);

    products.value = companyProducts;
  }

  Future<void> filter() async {
    if (selectedCategory.value != null) {
      products.value = Data.inProgress();
      Data<List<Product>> companyProducts = await Get.find<MainRepo>()
          .productRepo
          .fliterProducts(
              FilterProductsDto(categories: [selectedCategory.value!]));

      products.value = companyProducts;
    }
  }

  Future<void> initCategories() async {
    var data = await _productRepo.getCategories();
    if (data.isSucceed) {
      categories.value = data.data ?? [];
    }
  }

  Future<void> changeCategory(Category category) async {
    if (selectedCategory.value != category) {
      selectedCategory.value = category;
      filter();
    }
  }
}
