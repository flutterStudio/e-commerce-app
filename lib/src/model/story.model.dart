import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/model/model.dart';

class Story extends Model {
  int? id;
  String? attachment;
  int? userId;

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
    model.id = json.containsKey('StoryId') ? json["StoryId"] : null;
    model.attachment = json.containsKey('attachment')
        ? json['attachment']["downloadUrl"]
        : null;
    model.userId = json.containsKey('user') ? json['user']["userId"] : null;
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
