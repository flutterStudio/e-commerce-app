import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:flutter/widgets.dart';

import 'model.dart';

class Product implements Model {
  late int? id;
  String? title, description, mainImage;
  List<String>? images;
  List<Color>? colors;
  double? rating, price, discount;
  int? minQuantity, availableQuantity;
  bool? isFavourite, isPopular, isActive;
  Product({
    this.id,
    this.images,
    this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    this.title,
    this.price,
    this.description,
  });

  @override
  ModelSerializer<Product> serilizer() {
    return _ProductSerializer(this);
  }
}

class _ProductSerializer extends ModelSerializer<Product> {
  _ProductSerializer(Product model) : super(model);

  @override
  Product fromJson(Map<String, dynamic> json) {
    model.id = json["productId"];
    model.title = json["title"];
    model.description = json["description"];
    model.images = json["images"];
    model.colors = json["colors"];
    model.price = json["price"];
    model.discount = json["discount"];
    model.minQuantity = json["minQuantity"];
    model.availableQuantity = json["availableQuantity"];
    model.isActive = json["isActive"];
    model.mainImage = json["mainImage"]["downloadUrl"];
    _initImagesList(json);
    return model;
  }

  void _initImagesList(Map<String, dynamic> json) {
    var attachments = json["productImagesList"] as List;
    List<String> images = [];
    for (var attachment in attachments) {
      images.add(attachment["attachment"]["downloadUrl"]);
    }
    model.images = images;
  }

  @override
  Map<String, dynamic> toJson() {
    return {"id": model.id, "title": model.title};
  }
}
