import 'package:e_commerce/src/view/cms/add_product/cms.add_product.controller.dart';
import 'package:e_commerce/src/view/shared/file_uploader/file_uploader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilesUpload extends GetView<CMSAddProductController> {
  const FilesUpload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("product-attachments".tr),
            IconButton(
                onPressed: () => controller.fileUploaderController.pickFiles(),
                icon: const Icon(Icons.add))
          ],
        ),
        FileUploader(
          controller: controller.fileUploaderController,
        )
      ],
    );
  }
}
