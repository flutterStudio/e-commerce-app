import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/cms/products/cms.products.controller.dart';
import 'package:e_commerce/src/view/shared/custom_network_image.widget.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CMSProductsList extends GetWidget<CMSProductsController> {
  const CMSProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondaryVariant,
      child: Obx(() {
        return RequestHandler<List<Product>>(
          data: controller.products.value,
          onSuccess: (BuildContext context, List<Product> items) =>
              ListView.builder(
                  itemCount: controller.products.value.data!.length,
                  itemBuilder: (context, index) {
                    Product? product = controller.products.value.data?[index];
                    return ExpansionTile(
                      // onTap: () {
                      //   Get.toNamed("/product/${product?.id}");
                      // },

                      children: [
                        Row(children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.delete)),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.edit)),
                        ])
                      ],
                      leading: CustomNetworkImage(
                        url: product?.mainImage ?? "",
                      ),
                      title: Text(
                        product?.title ?? "",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                      ),
                      subtitle: Text.rich(
                        TextSpan(
                          text: "\$${product?.price}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary),
                          children: [
                            product?.discount != null
                                ? TextSpan(
                                    text: " disount: ${product?.discount}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary))
                                : const TextSpan(),
                          ],
                        ),
                      ),
                      // child: CMSProductItem(
                      //   product: product,
                      // ),
                    );
                  }),
        );
      }),
    );
  }
}
