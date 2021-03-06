import 'package:e_commerce/src/controller/cart_screen.controller.dart';
import 'package:e_commerce/src/model/cart.model.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
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
          return RequestHandler<Cart>(
            data: controller.cart.value,
            onErrorRetry: () {
              controller.getCart();
            },
            onSuccess: (context, data) => ListView.builder(
              itemCount: data.orderProducts?.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(data.orderProducts![index].product!.id.toString()),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {},
                  confirmDismiss: (direction) async {
                    return await controller
                        .remove(data.orderProducts![index].orderProductId!);
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  child: CartCard(cart: data.orderProducts![index]),
                ),
              ),
            ),
            inProgress: const RefreshProgressIndicator(),
          );
        }));
  }

  double getProportionateScreenWidth(double val) {
    return val;
  }
}
