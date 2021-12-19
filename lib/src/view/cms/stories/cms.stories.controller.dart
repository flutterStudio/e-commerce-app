import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/story.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:e_commerce/src/service/auth_service.dart';
import 'package:e_commerce/src/view/shared/file_uploader/file_uploader.controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:story_view/controller/story_controller.dart';

class CMSStoriesController extends GetxController {
  Rx<Data<List<Story>>> stories = Rx<Data<List<Story>>>(Data.empty());
  Rx<Data<List<Data<Story>>>> addedStory =
      Rx<Data<List<Data<Story>>>>(Data.empty());
  FileUploaderController fileUploaderController = FileUploaderController();
  Rx<List<String>> errors = Rx([]);

  CMSStoriesController() {
    getStories();
  }
  final StoryController storiesController = StoryController();
  final MainRepo _mainRepo = Get.find<MainRepo>();

  Future<void> getStories() async {
    stories.value = Data.inProgress();
    var userId = Get.find<AuthService>().currentUser.value?.id;
    if (userId != null) {
      stories.value = await _mainRepo.storiesRepo.getCompanyStories(userId);
    } else {
      stories.value = Data.faild(message: "no current user");
    }
  }

  Future<void> addStory() async {
    var attachments = await fileUploaderController.getAttachments();

    if (attachments.isEmpty) {
      errors.update((val) {
        val?.add("message-error-no-attachment-file".tr);
      });
      return;
    }
    addedStory.value =
        Data.inProgress(showSnackbar: true, message: "posting-stories".tr);

    addedStory.value = await _mainRepo.storiesRepo.postStories(
        attachments.map((e) => e.attachmentId.toString()).toList());
    if (addedStory.value.isSucceed) {
      stories.update((val) {
        val?.data?.addAll(addedStory.value.data!.map((e) => e.data!));
      });

      fileUploaderController.clearAll();
    }
  }

  Future<void> deleteStory(String id) async {
    Data.inProgress(showSnackbar: true, message: "deleting @item".tr);
    var result = await _mainRepo.storiesRepo.deleteStory(id);
    if (result.isSucceed) {
      stories.update((val) {
        val?.data?.removeWhere((element) => element.id.toString() == id);
      });
    }
  }
}
