import 'package:e_commerce/src/controller/product_list.controller.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/request_handler.dart';
import 'package:e_commerce/src/view/shared/product_item.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductsListScreen extends GetView<ProductListcontroller> {
  const ProductsListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Get.back(),
          ),
        ),
        body: Obx(() {
          return RequestHandler<List<Product>>(
            data: controller.products.value,
            onSuccess: (BuildContext context, List<Product> items) =>
                GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: .8),
                    itemCount: controller.products.value.data!.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Get.toNamed(
                                "/product/${controller.products.value.data![index].id}");
                          },
                          child: ProductCard(
                            product: controller.products.value.data![index],
                          ),
                        )),
          );
        }));
  }
}
