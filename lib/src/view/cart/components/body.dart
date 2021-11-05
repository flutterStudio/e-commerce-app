import 'package:e_commerce/src/controller/cart_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'cart_card.dart';

class CartBody extends GetView<CartScreenController> {
  const CartBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Obx(() {
        return ListView.builder(
          itemCount: controller.items.value.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(controller.items.value[index].product.id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                controller.items.value.removeAt(index);
              },
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg"),
                  ],
                ),
              ),
              child: Obx(() => CartCard(cart: controller.items.value[index])),
            ),
          ),
        );
      }),
    );
  }

  double getProportionateScreenWidth(double val) {
    return val;
  }
}
