import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/main_screen_item.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OfferScreenCopntroller extends GetxController {
  Rx<Data<List<ScreenItem>>> screenItems =
      Rx<Data<List<ScreenItem>>>(Data.empty());
  OfferScreenCopntroller();

  final MainRepo _mainRepo = Get.find<MainRepo>();

  Future<void> getMainScreenItems({int? page, int? pageSize}) async {
    if (page == null) {
      screenItems.value = Data.inProgress();
    }
    Data<List<ScreenItem>> items =
        await _mainRepo.offerRepo.getAllScreenItems();

    if (page == null) {
      screenItems.value = items;
      refreshController.refreshCompleted();
    } else {
      screenItems.value.copyProperties(items);
      screenItems.value.data?.addAll(items.data ?? []);
      refreshController.loadComplete();
    }
  }

  RefreshController refreshController = RefreshController();
}
