import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/story.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class StoriesController extends GetxController {
  Rx<Data<List<Story>>> allCompaniesStories =
      Rx<Data<List<Story>>>(Data.empty());

  Rx<Data<List<Story>>> currentCompanySroies =
      Rx<Data<List<Story>>>(Data.empty());

  Rx<int?> currentMarketId = Rx<int?>(null);

  final MainRepo _mainRepo = Get.find<MainRepo>();

  Future<void> getAllCompaniesStories() async {
    allCompaniesStories.value = Data.inProgress();
    allCompaniesStories.value =
        await _mainRepo.storiesRepo.getAllMarketsStories();
  }

  Future<void> getCurrentCompanyStories() async {
    if (currentMarketId.value == null) {
      return;
    }
    currentCompanySroies.value = Data.inProgress();
    currentCompanySroies.value =
        await _mainRepo.storiesRepo.getCompanyStories(currentMarketId.value!);
  }

  void setCurrentCompany(int id) {
    if (currentMarketId.value != id) {
      currentMarketId.value = id;
      getCurrentCompanyStories();
    }
  }
}
