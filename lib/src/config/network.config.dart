import 'package:e_commerce/src/config/enums.dart';

class NetworkConfig {
  /// The limit of file sizes for upload operations in Mega Bytes;
  static const Map<MediaType, int> fileUploadSizeLimit = {
    MediaType.audio: 5,
    MediaType.video: 10,
    MediaType.image: 3,
    MediaType.any: 10,
  };
}
