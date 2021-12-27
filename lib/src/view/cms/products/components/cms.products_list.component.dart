import 'package:e_commerce/src/config/routing/app_paths.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/cms/products/cms.products.controller.dart';
import 'package:e_commerce/src/view/shared/custom_network_image.widget.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CMSProductsList extends GetWidget<CMSProductsController> {
  const CMSProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RequestHandler<List<Product>>(
        data: controller.products.value,
        onSuccess: (BuildContext context, List<Product> items) => Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: ListView.builder(
              // shrinkWrap: true,
              dragStartBehavior: DragStartBehavior.start,
              physics: const ClampingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                Product product = items[index];
                return ExpansionTile(
                  children: [
                    Row(children: [
                      IconButton(
                          onPressed: product.id == null
                              ? null
                              : () {
                                  controller.deleteProduct(product.id!);
                                },
                          icon: const Icon(Icons.delete)),
                      IconButton(
                          onPressed: () {
                            Get.toNamed(AppPaths.admin + AppPaths.updateProduct,
                                arguments: [product]);
                          },
                          icon: const Icon(Icons.edit)),
                    ])
                  ],
                  leading: CustomNetworkImage(
                    url: product.mainImage ?? "",
                  ),
                  title: Text(
                    product.title ?? "",
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      text: "\$${product.price}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary),
                      children: [
                        product.discount != null
                            ? TextSpan(
                                text: " disount: ${product.discount}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(context).colorScheme.primary))
                            : const TextSpan(),
                      ],
                    ),
                  ),
                );
              }),
        ),
      );
    });
  }
}
