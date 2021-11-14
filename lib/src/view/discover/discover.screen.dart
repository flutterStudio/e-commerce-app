import 'package:e_commerce/src/controller/product_list.controller.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/request_handler.dart';
import 'package:e_commerce/src/view/shared/product_item.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class DiscoverScreen extends GetView<ProductListcontroller> {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Obx(
        () => RequestHandler<List<Product>>(
          data: controller.products.value,
          onSuccess: (context, data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ProductCard(
                    product: controller.products.value.data![index])),
          ),
          inProgress: const RefreshProgressIndicator(),
        ),
      )),
    );
  }
}
