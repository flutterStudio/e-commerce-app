import 'package:e_commerce/src/config/enums.dart';

class FileUtils {
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
}
