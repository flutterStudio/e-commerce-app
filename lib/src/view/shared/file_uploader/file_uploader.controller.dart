import 'dart:io';

import 'package:e_commerce/src/view/shared/file_uploader/componenets/file_uploader_info.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FileUploaderController extends GetxController {
  Rx<List<FileUploaderInfo>> files = Rx([]);

  void addFile(File file) {
    if (files.value.any((element) => element.file.path == file.path)) {
      // TODO : Show a toast
      return;
    }
    // TODO : Start uploading file
    var fileInfo = FileUploaderInfo(file: file);
    fileInfo.status = FileUploadStatus.uploading;
    files.value.add(fileInfo);
  }
}
