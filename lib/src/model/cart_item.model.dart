import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/model/model.dart';
import 'package:e_commerce/src/model/product.model.dart';

class CartItem implements Model {
  final Product product;
  int count;

  CartItem({required this.product, required this.count});

  @override
  ModelSerializer<CartItem> serilizer() {
    return _CartSerializer(this);
  }
}

class _CartSerializer extends ModelSerializer<CartItem> {
  _CartSerializer(CartItem model) : super(model);

  @override
  fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() =>
      {"product": model.product.id, "count": model.count};
}
