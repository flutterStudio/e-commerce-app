import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/view/cms/add_product/components/files_upload.dart';
import 'package:e_commerce/src/view/cms/stories/cms.stories.controller.dart';
import 'package:e_commerce/src/view/shared/default_button.dart';
import 'package:e_commerce/src/view/shared/file_uploader/componenets/file_uploader_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

class AddStoryForm extends GetView<CMSStoriesController> {
  const AddStoryForm({Key? key}) : super(key: key);

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        color: Theme.of(context).colorScheme.primaryVariant,
        child: Column(
          children: [
            FilesUpload(
              title: "story-file".tr,
              uploaderController: controller.fileUploaderController,
              onPickFiles: () {
                controller.fileUploaderController.pickFiles();
              },
            ),
            const SizedBox(height: SizeConfig.verticalSpace * 2),
            StreamBuilder(
              stream: controller.fileUploaderController.files.stream,
              builder: (context, files) {
                var filesInfo = controller.fileUploaderController
                    .getFilesByStatus(FileUploadStatus.uploaded);

                return Row(
                  children: [
                    Expanded(
                      child: DefaultButton(
                        child: Text(
                          "upload".tr,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                        ),
                        press: filesInfo.isNotEmpty
                            ? () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  controller.addStory();
                                }
                              }
                            : null,
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
