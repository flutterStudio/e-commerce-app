import 'package:e_commerce/src/controller/cart_screen.controller.dart';
import 'package:e_commerce/src/model/cart_item.model.dart';
import 'package:e_commerce/src/model/color.model.dart';
import 'package:e_commerce/src/model/size.model.dart';
import 'package:e_commerce/src/view/shared/product_instances/product_instance.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ProductInstances extends GetView<CartScreenController> {
  ProductInstances({Key? key}) : super(key: key);

  final List<CartItem> instances = [
    CartItem(
        color: ColorModel(colorValue: Colors.amber),
        size: Size(sizeValue: "SM"),
        count: 2),
    CartItem(
        color: ColorModel(colorValue: Colors.green),
        size: Size(sizeValue: "SM"),
        count: 2),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: instances.length,
                  itemBuilder: (context, index) => ProductInstance(
                        instance: instances[index],
                      )))
        ],
      ),
    );
  }
}
