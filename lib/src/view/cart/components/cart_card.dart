import 'package:e_commerce/src/model/cart_item.model.dart';
import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final CartItem cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cart.product!.images![0]),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product!.title ?? "No Title",
                style: const TextStyle(color: Colors.black, fontSize: 16),
                overflow: TextOverflow.clip,
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "\$${cart.product!.price}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary),
                  children: [
                    TextSpan(
                        text: " x ${cart.count}",
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  double getProportionateScreenWidth(double val) {
    return val;
  }
}
