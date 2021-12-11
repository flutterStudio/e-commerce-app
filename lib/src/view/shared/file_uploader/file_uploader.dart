import 'package:e_commerce/src/view/shared/file_uploader/componenets/file_item.dart';
import 'package:e_commerce/src/view/shared/file_uploader/componenets/files_list.dart';
import 'package:e_commerce/src/view/shared/file_uploader/file_uploader.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class FileUploader extends StatelessWidget {
  const FileUploader({Key? key, required this.controller}) : super(key: key);

  final FileUploaderController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.secondaryVariant,
        height: 100,
        child: Obx(
          () => FileUploaderList(controller.files.value
              .map((e) => FileUploaderItem(
                    info: e,
                  ))
              .toList()),
        ));
  }
}
