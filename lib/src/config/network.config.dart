import 'package:e_commerce/src/config/enums.dart';

class NetworkConfig {
  static const Map<MediaType, double> fileUploadSizeLimit = {
    MediaType.audio: 5,
    MediaType.video: 10,
    MediaType.image: 3,
  };
}
