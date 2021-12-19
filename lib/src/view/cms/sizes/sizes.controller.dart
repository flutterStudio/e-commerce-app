import 'package:e_commerce/src/model/size.model.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CMSSizesController extends GetxController {
  RxString size = RxString("");
  Rx<Data<Size>> addedSize = Rx<Data<Size>>(Data.empty());
  Rx<Data<List<Size>>> sizes = Rx<Data<List<Size>>>(Data.empty());
  RxList<Size> selectedSizes = RxList<Size>([]);

  CMSSizesController() : _selectable = true {
    initSizes();
  }
  CMSSizesController.selectable() : _selectable = true {
    initSizes();
  }
  final bool _selectable;
  final MainRepo _mainRepo = Get.find<MainRepo>();

  Future<void> addSize() async {
    addedSize.value = Data.inProgress(
        showSnackbar: true,
        message: "posting-item".trParams({"item": "size".tr}));
    addedSize.value = await _mainRepo.productRepo.postSize(size.value);
    if (addedSize.value.isSucceed) {
      if (addedSize.value.data != null) {
        sizes.update((val) {
          val?.data?.add(addedSize.value.data!);
        });
      }
    }
  }

  Future<void> initSizes() async {
    sizes.value = Data.inProgress();
    sizes.value = await _mainRepo.productRepo.getSizes();
  }

  Future<void> selectSize(Size size) async {
    if (!_selectable) {
      return;
    }
    if (!selectedSizes.contains(size)) {
      selectedSizes.addIf(!selectedSizes.contains(size), size);
    } else {
      selectedSizes.removeWhere((e) => e.id == size.id);
    }
  }

  void unSelectSize(Size size) {
    selectedSizes.removeWhere((e) => e.id == size.id);
  }

  bool isSizeSelected(Size size) {
    return selectedSizes.firstWhereOrNull((e) => size.id == e.id) == null
        ? false
        : true;
  }
}
