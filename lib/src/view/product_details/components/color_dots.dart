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
  final BoxShape? shape;
  const ColorDot({
    Key? key,
    required this.color,
    this.shape = BoxShape.rectangle,
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
        height: size,
        width: size,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          shape: shape!,
          color: Colors.transparent,
          borderRadius: shape == null ? BorderRadius.circular(10) : null,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 0,
                  color: isSelected
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.secondaryVariant)
            ],
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
