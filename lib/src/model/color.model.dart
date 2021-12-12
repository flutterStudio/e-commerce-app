import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/model/model.dart';
import 'package:e_commerce/src/utils/extensions.dart';
import 'package:flutter/material.dart';

class ColorModel extends Model {
  int? id;
  int? joiningId;
  Color? colorValue;

  ColorModel({this.id, this.colorValue});

  @override
  ModelSerializer<ColorModel> serilizer() {
    return _ColorSerializer(this);
  }
}

class _ColorSerializer extends ModelSerializer<ColorModel> {
  _ColorSerializer(ColorModel model) : super(model);

  @override
  ColorModel fromJson(Map<String, dynamic> json) {
    model.id =
        json.containsKey('color') ? json['color']["colorId"] : json["colorId"];
    model.colorValue = CustomColor.fromHex(json.containsKey('color')
        ? json['color']["colorValue"]
        : json["colorValue"]);
    model.joiningId =
        json.containsKey('productColorId') ? json["productColorId"] : null;
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  Map<String, dynamic> toJsonPostMinimum() {
    return {"colorId": model.id};
  }
}
