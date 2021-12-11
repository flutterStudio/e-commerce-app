import 'dart:io';

import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:e_commerce/src/view/shared/file_uploader/componenets/file_uploader_info.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class FileUploaderController extends GetxController {
  Rx<List<FileUploaderInfo>> files = Rx([]);
  void addFile(File file) {
    if (files.value.any((element) => element.file.path == file.path)) {
      // TODO : Show a toast
      return;
    }
    // TODO : Start uploading file
    uploadFile(file);
    var fileInfo = FileUploaderInfo(file: file);
    fileInfo.status = FileUploadStatus.uploading;
    files.update((val) {
      val?.add(fileInfo);
    });
  }

  Future<void> pickFiles() async {
    var result = await FilePicker.platform.pickFiles();
    if (result != null) {
      for (var element in result.files) {
        if (element.path != null) {
          addFile(File(element.path!));
        }
      }
    }
  }

  Future<void> uploadFile(file) async {
    Get.find<MainRepo>()
        .attachmentsRepo
        .uplaod(file)
        .then((value) => value.isSucceed);
  }
}
