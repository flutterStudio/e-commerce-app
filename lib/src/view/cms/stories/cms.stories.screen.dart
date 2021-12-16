import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/model/story.model.dart';
import 'package:e_commerce/src/view/cms/add_product/components/files_upload.dart';
import 'package:e_commerce/src/view/cms/stories/cms.stories.controller.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:story_view/story_view.dart';

class CMSStoriesScreen extends GetView<CMSStoriesController> {
  CMSStoriesScreen({Key? key}) : super(key: key);

  final StoryController _controller = StoryController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() {
            return RequestHandler<List<Story>>(
              data: controller.stories.value,
              onSuccess: _onSuccess,
              inProgress: Container(
                color: Theme.of(context).colorScheme.secondary,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }),
          FilesUpload(
            title: "product-attachments".tr,
            uploaderController: controller.fileUploaderController,
            onPickFiles: () {
              controller.fileUploaderController.pickFiles();
            },
          ),
        ],
      ),
    );
  }

  Widget _onSuccess(BuildContext context, List<Story> data) => StoryView(
      controller: _controller,
      storyItems: data
          .map((e) => e.mediaType == MediaType.video
              ? StoryItem.pageVideo(e.attachment ?? "",
                  shown: true, controller: controller.storyController)
              : StoryItem.inlineImage(
                  url: e.attachment ?? "",
                  controller: controller.storyController))
          .toList());
}
