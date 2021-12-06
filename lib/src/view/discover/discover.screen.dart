import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/controller/discover_screen.controller.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/mixins/refreshable.mixin.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:e_commerce/src/view/shared/product_item.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class DiscoverScreen extends GetView<Discovercontroller> with RefreshableMixin {
  const DiscoverScreen({Key? key}) : super(key: key);
  @override
  Widget body(BuildContext context) {
    return Center(
        child: Obx(
      () => RequestHandler<List<Product>>(
        data: controller.products.value,
        onSuccess: (context, data) => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: SizeConfig.verticalSpace,
                crossAxisCount: 2,
                childAspectRatio: .7),
            itemCount: data.length,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Get.toNamed("/product/${data[index].id}");
                },
                child: ProductCard(
                  product: data[index],
                ))),
        onErrorRetry: () {
          Get.find<Discovercontroller>().getProducts();
        },
        inProgress: const RefreshProgressIndicator(),
      ),
    ));
  }

  @override
  Future<void> onRefresh() {
    return controller.getProducts();
  }
}
