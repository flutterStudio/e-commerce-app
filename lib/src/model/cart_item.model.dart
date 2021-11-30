import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/model/color.model.dart';
import 'package:e_commerce/src/model/model.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/model/size.model.dart';

class CartItem implements Model {
  Product? product;
  int? orderProductId;
  int? count;
  ColorModel? color;
  Size? size;
  double? orderPrice;
  CartItem({this.color, this.count, this.size});
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
    model.orderProductId = json["orderProductId"];

    return model;
  }

  @override
  Map<String, dynamic> toJson() =>
      {"product": model.product!.id, "quantity ": model.count};
}
