import 'dart:io';

import 'package:e_commerce/src/model/attachment.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/view/shared/file_uploader/componenets/file_uploader_info.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class FileUploaderController {
  Rx<List<FileUploaderInfo>> files = Rx([]);

  void addFile(FileUploaderInfo fileInfo) {
    if (files.value.any((element) => element.file.path == fileInfo.file.path)) {
      Utils.showSnackBar("message-file-already-exists".tr,
          background: Get.theme.colorScheme.secondaryVariant,
          color: Get.theme.colorScheme.primary);
      return;
    }
    files.update((val) {
      val?.add(fileInfo);
    });
    uploadFile(fileInfo);
  }

  Future<void> pickFiles() async {
    var result = await FilePicker.platform.pickFiles();
    if (result != null) {
      for (var element in result.files) {
        if (element.path != null) {
          addFile(FileUploaderInfo(file: File(element.path!)));
        }
      }
    }
  }

  Future<void> reUploadFaild() async {
    for (var info in files.value) {
      if (info.attachment == null && info.status == FileUploadStatus.faild) {
        uploadFile(info);
      }
    }
  }

  Future<void> uploadFile(FileUploaderInfo info) async {
    updateFileStatus(info, FileUploadStatus.uploading);
    // files.update((val) {
    //   val?.firstWhere((fileInfo) => fileInfo.file == info.file);
    // });
    Get.find<MainRepo>().attachmentsRepo.uplaod(info.file).then((value) {
      if (value.isSucceed) {
        updateFileStatus(info, FileUploadStatus.uploaded,
            attachment: value.data);
      }
      if (value.isFaild) {
        updateFileStatus(info, FileUploadStatus.faild);
      }
    });
  }

  void updateFileStatus(FileUploaderInfo info, FileUploadStatus status,
      {Attachment? attachment}) {
    FileUploaderInfo? fileUploaderInfo =
        files.value.firstWhereOrNull((element) => element.file == info.file);
    if (fileUploaderInfo != null) {
      fileUploaderInfo.status = status;
      if (status == FileUploadStatus.uploaded) {
        fileUploaderInfo.attachment = attachment;
      }
    }

    files.update((val) {
      files.value = files.value;
    });
  }

  Future<List<Attachment>> getAttachments() async {
    if (files.value.isNotEmpty) {
      return files.value
          .where((element) => element.attachment != null)
          .map((data) => data.attachment!)
          .toList();
    }
    return [];
  }

  void clearAll() {
    files.value = [];
  }

  List<FileUploaderInfo> getFilesByStatus(FileUploadStatus status) {
    return files.value.where((element) => element.status == status).toList();
  }
}
