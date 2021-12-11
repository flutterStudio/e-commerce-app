import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/model/model.dart';

class Attachment implements Model {
  int? attachmentId;
  String? fileName, downloadUrl;
  @override
  ModelSerializer<Attachment> serilizer() {
    return _CartSerializer(this);
  }
}

class _CartSerializer extends ModelSerializer<Attachment> {
  _CartSerializer(Attachment model) : super(model);

  @override
  fromJson(Map<String, dynamic> json) {
    model.attachmentId = json["attachmentId"];
    model.fileName = json["fileName"];
    model.downloadUrl = json["downloadUrl"];

    return model;
  }

  @override
  Map<String, dynamic> toJson() => throw UnimplementedError();

  Map<String, dynamic> toJsonPostMinimum() {
    return {"attachmentId": model.attachmentId};
  }
}
