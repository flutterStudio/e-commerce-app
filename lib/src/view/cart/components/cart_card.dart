import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/model/cart_item.model.dart';
import 'package:e_commerce/src/view/product_details/components/color_dots.dart';
import 'package:e_commerce/src/view/shared/custom_network_image.widget.dart';
import 'package:e_commerce/src/view/shared/size.widget.dart';
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
              child: CustomNetworkImage(
                url: cart.product?.mainImage ?? "",
              ),
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
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const WidgetSpan(
                        child: SizedBox(
                      width: SizeConfig.horizontalSpace,
                    )),
                    cart.product?.discount != null
                        ? TextSpan(
                            text: " disount: ${cart.product!.discount}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary))
                        : TextSpan(),
                  ],
                ),
              ),
              Row(
                children: [
                  cart.color?.colorValue == null
                      ? Container()
                      : ColorDot(
                          size: 30,
                          color: cart.color!.colorValue!,
                        ),
                  cart.size?.sizeValue == null
                      ? Container()
                      : SizeWidget(
                          size: 30,
                          value: cart.size!,
                        )
                ],
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
