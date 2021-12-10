import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/controller/product.controller.dart';
import 'package:e_commerce/src/model/size.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SizeWidget extends GetWidget<ProductController> {
  final Size value;
  final VoidCallback? onSelect;
  final double? size;
  final bool isSelected;
  const SizeWidget(
      {Key? key,
      this.size,
      this.isSelected = false,
      required this.value,
      this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onSelect,
        child: Container(
          height: size,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(
              horizontal: SizeConfig.horizontalSpace),
          padding: const EdgeInsets.all(SizeConfig.horizontalSpace),
          child: Text(
            value.sizeValue!,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : const Color(0xffC5C5C5)),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 2,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : const Color(0xffC5C5C5)),
              color: isSelected
                  ? Theme.of(context).colorScheme.primaryVariant
                  : Theme.of(context).colorScheme.background),
        ));
  }
}
