import 'package:e_commerce/src/controller/cart_screen.controller.dart';
import 'package:e_commerce/src/view/shared/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class CheckoutCard extends GetView<CartScreenController> {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  return Text.rich(
                    TextSpan(
                      text: "total-price".tr,
                      style: Theme.of(context).textTheme.bodyText2,
                      children: [
                        TextSpan(
                          text:
                              "\n\$ ${controller.cart.value.data?.finalPrice?.truncateToDouble() ?? 0}",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  );
                }),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    child: Text(
                      "Check out",
                      style: Theme.of(context).textTheme.button?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    press: () {
                      controller.checkout();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double getProportionateScreenWidth(double val) {
    return val;
  }
}
