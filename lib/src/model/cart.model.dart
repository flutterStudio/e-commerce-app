import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/model/cart_item.model.dart';
import 'package:e_commerce/src/model/model.dart';

class Cart extends Model {
  double? finalPrice;
  int? orderId;
  List<CartItem>? orderProducts;
  DateTime? orderDate;
  bool? isInCart;

  Cart({this.orderProducts, this.finalPrice, this.isInCart, this.orderDate});

  @override
  ModelSerializer<Cart> serilizer() {
    return _CartSerializer(this);
  }
}

class _CartSerializer extends ModelSerializer<Cart> {
  _CartSerializer(Cart model) : super(model);

  @override
  Cart fromJson(Map<String, dynamic> json) {
    model.isInCart = json['isInCart'];
    model.orderDate = DateTime.tryParse(json['orderDate'])!;
    model.finalPrice = json['finalPrice'];
    model.orderId = json['orderId'];
    List<CartItem> items = [];
    for (var item in json['orderProducts']) {
      CartItem cartItem = CartItem().serilizer().fromJson(item);
      items.add(cartItem);
    }
    model.orderProducts = items;
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
