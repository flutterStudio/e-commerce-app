import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/model/model.dart';
import 'package:e_commerce/src/utils/file.utils.dart';

class Story extends Model {
  int? id;
  String? attachment;
  int? userId;
  MediaType? mediaType;
  Story({this.id, this.attachment});

  @override
  ModelSerializer<Story> serilizer() {
    return _StorySerializer(this);
  }
}

class _StorySerializer extends ModelSerializer<Story> {
  _StorySerializer(Story model) : super(model);

  @override
  Story fromJson(Map<String, dynamic> json) {
    model.id = json.containsKey('storyId')
        ? json['storyId'] == null
            ? null
            : json["storyId"]
        : null;
    model.attachment = json.containsKey('attachment')
        ? json['attachment'] == null
            ? null
            : _emulatorImage(json['attachment']["downloadUrl"])
        : null;
    model.userId = json.containsKey('user')
        ? json['user'] == null
            ? null
            : json['user']["userId"]
        : null;
    model.mediaType = model.attachment != null
        ? FileUtils.filesTypes[json['attachment']['type']]
        : null;
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  String? _emulatorImage(String? url) {
    return url?.replaceFirst(
        "https://127.0.0.1:5001", "http://94.242.58.41:5002");
  }
}
