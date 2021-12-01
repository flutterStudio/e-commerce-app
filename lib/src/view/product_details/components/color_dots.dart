import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/controller/product.controller.dart';
import 'package:e_commerce/src/model/product.model.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Obx(() {
        return Row(
          children: [
            ...List.generate(
              product?.colors?.length ?? 0,
              (index) => ColorDot(
                onSelected: () {
                  controller.selectedColor(product?.colors?[index]);
                },
                color: product!.colors![index].colorValue!,
                isSelected: controller.selectedColor.value?.colorValue ==
                    product?.colors?[index].colorValue,
              ),
            ),
          ],
        );
      }),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
    this.onSelected,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  final VoidCallback? onSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        margin: const EdgeInsets.only(right: SizeConfig.horizontalSpace),
        height: isSelected ? 50 : 40,
        width: isSelected ? 50 : 40,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
          ),
          child: isSelected
              ? Icon(Icons.verified_sharp,
                  color: Theme.of(context).colorScheme.primary)
              : Container(),
        ),
      ),
    );
  }
}
