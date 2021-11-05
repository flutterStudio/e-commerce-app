import 'package:e_commerce/src/model/model.dart';
import 'package:e_commerce/src/model/product.model.dart';

class CartItem implements Model {
  final Product product;
  int count;

  CartItem({required this.product, required this.count});

  @override
  Map<String, dynamic> toJson() => {"product": product.id, "count": count};
}
