import 'package:e_commerce/src/view/shared/file_uploader/file_uploader.controller.dart';
import 'package:e_commerce/src/view/shared/file_uploader/file_uploader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilesUpload extends StatelessWidget {
  const FilesUpload(
      {required this.onPickFiles,
      required this.title,
      required this.uploaderController,
      Key? key})
      : super(key: key);

  final void Function()? onPickFiles;
  final String title;
  final FileUploaderController? uploaderController;

  @override
  Widget build(BuildContext context) {
    return
        // Column(
        //   children: [
        // Row(
        //   children: [
        //     Text(title),
        //     IconButton(onPressed: onPickFiles, icon: const Icon(Icons.add))
        //   ],
        // ),
        FileUploader(
      title: title,

      controller: uploaderController!,
      //   )
      // ],
    );
  }
}
