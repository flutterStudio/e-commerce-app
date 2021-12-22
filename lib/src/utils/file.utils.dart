import 'dart:io';

import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/config/network.config.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class FileUtils {
  static List<String> videoTypes = [
    "mp4",
    "mpeg",
    "ogg",
    "mp2t",
    "webm",
    "3gpp",
    "3gpp2"
  ];

  static List<String> imageTypes = [
    "png",
    "jpeg",
    "jpg",
    "gif",
  ];

  static Map<String, MediaType> filesTypes = {
    "image/png": MediaType.image,
    "image/jpeg": MediaType.image,
    "image/gif": MediaType.image,
    "video/mp4": MediaType.video,
    "video/mpeg": MediaType.video,
    "video/ogg": MediaType.video,
    "video/mp2t": MediaType.video,
    "video/webm": MediaType.video,
    "video/3gpp": MediaType.video,
    "video/3gpp2": MediaType.video,
    "video/x-msvideo": MediaType.video,
  };

  static MediaType getFileTypeByExtension(String extension) {
    if (imageTypes.contains(extension)) {
      return MediaType.image;
    }
    if (videoTypes.contains(extension)) {
      return MediaType.video;
    }
    return MediaType.any;
  }

  static String? getFileExtension(String file) {
    int start = file.lastIndexOf(".");
    if (start == -1) {
      return null;
    }
    return file.substring(start + 1, file.length);
  }

  static MediaType getFileType(String file) {
    String? extension = getFileExtension(file);
    if (extension != null) {
      return getFileTypeByExtension(extension.toLowerCase());
    }

    return MediaType.none;
  }

  static String? getFileName(File file) {
    var path = file.path;
    int start = path.lastIndexOf("/");
    if (start == -1) {
      return null;
    }
    return path.substring(start + 1, path.length);
  }

  static Future<bool> checkFileSize(File file) async {
    MediaType type = getFileType(file.path);
    var fileSize = await file.length();
    var allowedSized =
        NetworkConfig.fileUploadSizeLimit[type]!.toInt() * 1024 * 1024;
    return fileSize <= allowedSized;
  }

  static Future<Image?> getVideoThumbnail({String? url, File? file}) async {
    if (file != null) {
      final uint8list = await VideoThumbnail.thumbnailData(
        video: file.path,
        imageFormat: ImageFormat.JPEG,
        maxWidth:
            128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
        quality: 25,
      );

      return uint8list == null ? null : Image.memory(uint8list);
    }

    if (url != null) {
      String? path = await VideoThumbnail.thumbnailFile(
        video: url,
        // thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.WEBP,
        maxHeight:
            64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
        quality: 75,
      );
      File? file = path == null ? null : File(path);
      return file == null ? null : Image.file(file);
    }
  }
}
