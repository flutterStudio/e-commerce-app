import 'package:e_commerce/src/model/model.dart';

abstract class ModelSerializer<T extends Model> {
  T model;
  ModelSerializer(this.model);
  void fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}