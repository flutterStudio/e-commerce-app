import 'package:flutter/widgets.dart';

import 'model.dart';

class Product implements Model {
  int? id;
  String? title, description;
  List<String>? images;
  List<Color>? colors;
  double? rating, price;
  bool? isFavourite, isPopular;
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

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    images = json["images"];
    colors = json["colors"];
    price = json["price"];
  }

  @override
  Map<String, dynamic> toJson() {
    return {"id": id, "title": title};
  }
}
