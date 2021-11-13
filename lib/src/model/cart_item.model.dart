import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/model/model.dart';
import 'package:e_commerce/src/model/product.model.dart';

class CartItem implements Model {
  Product? product;
  int? count;
  double? orderPrice;

  @override
  ModelSerializer<CartItem> serilizer() {
    return _CartSerializer(this);
  }
}

class _CartSerializer extends ModelSerializer<CartItem> {
  _CartSerializer(CartItem model) : super(model);

  @override
  fromJson(Map<String, dynamic> json) {
    model.product = Product().serilizer().fromJson(json["product"]);
    model.orderPrice = json["orderPrice"];
    model.count = json["quantity"];

    return model;
  }

  @override
  Map<String, dynamic> toJson() =>
      {"product": model.product!.id, "quantity ": model.count};
}
