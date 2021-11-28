import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/model/model.dart';

class Color extends Model {
  int? id;
  String? colorValue;

  Color({this.id, this.colorValue});

  @override
  ModelSerializer<Color> serilizer() {
    return _ColorSerializer(this);
  }
}

class _ColorSerializer extends ModelSerializer<Color> {
  _ColorSerializer(Color model) : super(model);

  @override
  Color fromJson(Map<String, dynamic> json) {
    model.id = json["colorId"];
    model.colorValue = json["colorValue"];
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
