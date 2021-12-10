import 'dart:io';

import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/view/shared/file_uploader/componenets/file_item.dart';
import 'package:e_commerce/src/view/shared/file_uploader/componenets/file_uploader_info.dart';
import 'package:e_commerce/src/view/shared/file_uploader/componenets/files_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilesUpload extends StatelessWidget {
  const FilesUpload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('product-attachments'.tr),
        const SizedBox(
          height: SizeConfig.verticalSpace,
        ),
        Container(
          color: Theme.of(context).colorScheme.secondaryVariant,
          height: 100,
          child: FileUploaderList(List.filled(
            3,
            FileUploaderItem(
              info: FileUploaderInfo(file: File("sad")),
            ),
          )),
        )
      ],
    );
  }
}
