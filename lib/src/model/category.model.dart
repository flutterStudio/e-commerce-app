import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/model/model.dart';

class Category extends Model {
  int? id;
  String? title;

  Category(this.id, this.title);

  @override
  ModelSerializer<Category> serilizer() {
    return _CategorySerializer(this);
  }
}

class _CategorySerializer extends ModelSerializer<Category> {
  _CategorySerializer(Category model) : super(model);

  @override
  Category fromJson(Map<String, dynamic> json) {
    model.id = json["categoryId"];
    model.title = json["title"];
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
