import 'package:e_commerce/src/model/color.model.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/model/size.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:e_commerce/src/view/product_details/components/sizes_list.widget.dart';
import 'package:get/get.dart';

class CMSAddProductController extends GetxController {
  Rx<List<String>>? errors = Rx([]);
  Rx<Data<Product>> loginStatus = Rx(Data.empty());
  Rx<Data<List<ColorModel>>> availableColors = Rx(Data.empty());
  Rx<Data<SizesList>> availableSizess = Rx(Data.empty());

  Rx<String?> title = Rx(null);
  Rx<String?> description = Rx(null);
  Rx<int?> minQuantity = Rx(null);
  Rx<int?> availableQuntity = Rx(null);
  Rx<double?> price = Rx(null);

  Rx<List<ColorModel>>? selectedColors = Rx([]);
  Rx<List<Size>>? sizes = Rx([]);

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
}
