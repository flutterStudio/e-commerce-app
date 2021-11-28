import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:e_commerce/src/utils/extensions/hexcolor.extension.dart';

class ColorModel extends Model {
  int? id;
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
    model.id = json["colorId"];
    model.colorValue = HexColor.fromHex((json["colorValue"]));
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
