import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/model/model.dart';

class Size extends Model {
  int? id;
  String? sizeValue;
  int? joiningId;

  Size({this.id, this.sizeValue});

  @override
  ModelSerializer<Size> serilizer() {
    return _SizeSerializer(this);
  }
}

class _SizeSerializer extends ModelSerializer<Size> {
  _SizeSerializer(Size model) : super(model);

  @override
  Size fromJson(Map<String, dynamic> json) {
    model.id = json.containsKey(json['size'])
        ? json["size"]["sizeId"]
        : json["sizeId"];
    model.sizeValue = json.containsKey(json['size'])
        ? json["size"]["sizeValue"]
        : json["sizeValue"];
    model.joiningId =
        json.containsKey(json['size']) ? json["productSizeId"] : null;
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  Map<String, dynamic> toJsonPostMinimum() {
    return {"sizeId": model.id};
  }
}
