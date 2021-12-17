import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/view/cms/add_product/cms.add_product.controller.dart';
import 'package:e_commerce/src/view/cms/add_product/components/files_upload.dart';
import 'package:e_commerce/src/view/shared/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

class AddStoryForm extends GetView<CMSAddProductController> {
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
            DefaultButton(
              child: Text(
                "continue".tr,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
              press: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  controller.addProduct();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
