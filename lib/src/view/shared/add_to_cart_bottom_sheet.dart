import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/product_details/components/color_dots.dart';
import 'package:e_commerce/src/view/product_details/components/rounded_icon_btn.dart';
import 'package:e_commerce/src/view/product_details/components/sizes_list.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToCartBottomModal extends StatelessWidget {
  const AddToCartBottomModal({Key? key, required this.product})
      : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColorDots(product: product),
        const SizesList(), // RoundedIconBtn(

        Row(
          children: [
            RoundedIconBtn(
              icon: Icons.remove,
              color: Theme.of(context).colorScheme.primary,
              background: Theme.of(context).colorScheme.primaryVariant,
              press: () {
                // controller.decreaseCount();
              },
            ),
            const SizedBox(width: 10),
            RoundedIconBtn(
              color: Theme.of(context).colorScheme.primary,
              background: Theme.of(context).colorScheme.primaryVariant,
              icon: Icons.add,
              showShadow: true,
              press: () {
                // controller.increaseCount();
              },
            ),
          ],
        )
      ],
    );
  }
}
