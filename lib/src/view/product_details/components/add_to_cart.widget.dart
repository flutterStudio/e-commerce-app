import 'package:e_commerce/src/config/routing/app_paths.dart';
import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/controller/product.controller.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/shared/default_button.dart';
import 'package:e_commerce/src/view/shared/rounded_icon_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

class AddToCart extends GetView<ProductController> {
  const AddToCart(this.product, {Key? key}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ProductCountWidget(),
        const Spacer(),
        DefaultButton(
          press: () {
            controller.addToCart();
            Get.toNamed(AppPaths.cart);
          },
          child: Text(
            "add-to-cart".tr,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ],
    );
  }
}

class _ProductCountWidget extends GetWidget<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedIconBtn(
          icon: Icons.remove,
          color: Theme.of(context).colorScheme.primary,
          background: Theme.of(context).colorScheme.primaryVariant,
          press: () {
            controller.decreaseCount();
          },
        ),
        const SizedBox(width: SizeConfig.horizontalSpace),
        Obx(() => Text("${controller.count.value}")),
        const SizedBox(width: SizeConfig.horizontalSpace),
        RoundedIconBtn(
          color: Theme.of(context).colorScheme.primary,
          background: Theme.of(context).colorScheme.primaryVariant,
          icon: Icons.add,
          showShadow: true,
          press: controller.count.value <
                  controller.product.value.data!.availableQuantity!
              ? () {
                  controller.increaseCount();
                }
              : null,
        ),
      ],
    );
  }
}
