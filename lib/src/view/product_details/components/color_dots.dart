import 'package:e_commerce/src/controller/product.controller.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/product_details/components/rounded_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ColorDots extends GetView<ProductController> {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 3;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          ...List.generate(
            product?.colors?.length ?? 0,
            (index) => ColorDot(
              color: product!.colors![index].colorValue!,
              isSelected: index == selectedColor,
            ),
          ),
          // const Spacer(),
          // RoundedIconBtn(
          //   icon: Icons.remove,
          //   press: () {
          //     controller.decreaseCount();
          //   },
          // ),
          // const SizedBox(width: 10),
          // RoundedIconBtn(
          //   icon: Icons.add,
          //   showShadow: true,
          //   press: () {
          //     controller.increaseCount();
          //   },
          // ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      padding: const EdgeInsets.all(8),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
