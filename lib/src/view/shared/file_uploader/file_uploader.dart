import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/view/shared/default_button.dart';
import 'package:e_commerce/src/view/shared/error_message.widget.dart';
import 'package:e_commerce/src/view/shared/file_uploader/componenets/file_item.dart';
import 'package:e_commerce/src/view/shared/file_uploader/componenets/file_uploader_info.dart';
import 'package:e_commerce/src/view/shared/file_uploader/componenets/files_list.dart';
import 'package:e_commerce/src/view/shared/file_uploader/file_uploader.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileUploader extends StatelessWidget {
  const FileUploader({Key? key, required this.controller, required this.title})
      : super(key: key);
  final String title;
  final FileUploaderController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizeConfig.verticalSpace),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryVariant,
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Expanded(child: Container()),
            StreamBuilder(
                stream: controller.files.stream,
                builder: (context, files) {
                  return Text(
                    "${controller.files.value.length} " + "files".tr,
                    style: Theme.of(context).textTheme.bodyText2,
                  );
                })
          ],
        ),
        const SizedBox(
          height: SizeConfig.verticalSpace,
        ),
        // GetX<FileUploaderController>(builder: (context) {
        StreamBuilder(
            stream: controller.files.stream,
            builder: (context, files) {
              return files.hasError
                  ? ErrorMessage(errors: [files.error.toString()])
                  : files.hasData
                      ? SizedBox(
                          height: 100,
                          child: FileUploaderList(controller.files.value
                              .map((e) => FileUploaderItem(
                                    info: e,
                                    controller: controller,
                                  ))
                              .toList()),
                        )
                      : Container();
            }),

        // }),
        const SizedBox(
          height: SizeConfig.verticalSpace,
        ),
        Row(
          children: [
            Expanded(
              child: DefaultButton(
                child: Text(
                  "upload".tr,
                  style: Theme.of(context).textTheme.button?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
                press: () {
                  controller.pickFiles();
                },
              ),
            ),
            Expanded(
              child: StreamBuilder(
                  stream: controller.files.stream,
                  builder: (context, files) {
                    int faildFilesCount = controller
                        .getFilesByStatus(FileUploadStatus.faild)
                        .length;
                    return faildFilesCount > 0
                        ? DefaultButton(
                            child: Text(
                              "repload".tr + " $faildFilesCount " + "files".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                            ),
                            press: () {
                              controller.reUploadFaild();
                            },
                          )
                        : Text(
                            "$faildFilesCount " + "faild".tr.tr,
                            style: Theme.of(context).textTheme.button?.copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                          );
                  }),
            ),
          ],
        ),
      ]),
    );
  }
}
