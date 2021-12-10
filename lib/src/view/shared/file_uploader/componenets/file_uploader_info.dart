import 'dart:io';

import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/utils/file.utils.dart';

class FileUploaderInfo {
  FileUploaderInfo({
    required File file,
  })  : _file = file,
        type = FileUtils.getFileType(file.path),
        status = FileUploadStatus.none;
  final File _file;
  File get file => _file;

  MediaType? type;
  FileUploadStatus? status;
}

enum FileUploadStatus { uploading, uploaded, faild, none }
