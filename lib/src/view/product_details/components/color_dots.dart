import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/controller/product.controller.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ColorDots extends GetView<ProductController> {
  const ColorDots({
    Key? key,
    this.interactive = false,
    required this.product,
  }) : super(key: key);

  final Product? product;
  final bool interactive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: interactive
          ? Obx(() {
              return _colorsList();
            })
          : _colorsList(),
    );
  }

  Widget _colorsList() => Row(
        children: [
          ...List.generate(
            product?.colors?.length ?? 0,
            (index) => ColorDot(
              onSelected: () {
                controller.selectedColor(product?.colors?[index]);
              },
              color: product!.colors![index].colorValue!,
              isSelected: interactive &&
                  controller.selectedColor.value?.colorValue ==
                      product?.colors?[index].colorValue,
            ),
          ),
        ],
      );
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
    this.onSelected,
    this.size = 40,
  }) : super(key: key);

  final double size;
  final Color color;
  final bool isSelected;

  final VoidCallback? onSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        margin: const EdgeInsets.only(right: SizeConfig.horizontalSpace),
        height: isSelected ? size + 10 : size,
        width: isSelected ? size + 10 : size,
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
