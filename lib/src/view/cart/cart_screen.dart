import 'package:e_commerce/src/controller/cart_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends GetView<CartScreenController> {
  static String routeName = "/cart";

  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const CartBody(),
      bottomNavigationBar: const CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          const Text(
            "Cart",
            style: TextStyle(color: Colors.black),
          ),
          Obx(() {
            return Text(
              "${controller.items.value.length} items",
              style: Theme.of(context).textTheme.caption,
            );
          }),
        ],
      ),
    );
  }
}
