import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/model/color.model.dart';
import 'package:e_commerce/src/model/size.model.dart';

import 'model.dart';

class Product implements Model {
  late int? id;
  String? title, description, mainImage;
  List<String>? images;
  List<ColorModel>? colors;
  List<Size>? sizes;
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
    model.price = json["price"];
    model.discount = json["discount"];
    model.minQuantity = json["minQuantity"];
    model.availableQuantity = json["availableQuantity"];
    model.isActive = json["isActive"];
    model.mainImage = _emulatorImage(json["mainImage"]?["downloadUrl"]);
    _initColors(json["productColors"]);
    _initImagesList(json);
    _initSizes(json["productSizes"]);
    return model;
  }

  void _initImagesList(Map<String, dynamic> json) {
    var attachments = json["productImagesList"] ?? [];
    List<String> images = [];
    for (var attachment in attachments) {
      images.add(_emulatorImage(attachment["attachment"]?["downloadUrl"]));
    }
    model.images = images;
  }

  void _initColors(Map<String, dynamic> json) {
    List<ColorModel> colors = [];
    for (var color in json as List) {
      colors.add(ColorModel().serilizer().fromJson(color));
    }
    model.colors = colors;
  }

  void _initSizes(Map<String, dynamic> json) {
    List<Size> sizes = [];
    for (var color in json as List) {
      sizes.add(Size().serilizer().fromJson(color));
    }
    model.sizes = sizes;
  }

  String _emulatorImage(String url) {
    return url.replaceFirst("https://127.0.0.1:5001", "http://10.0.2.2:5000");
  }

  @override
  Map<String, dynamic> toJson() {
    return {"id": model.id, "title": model.title};
  }
}
