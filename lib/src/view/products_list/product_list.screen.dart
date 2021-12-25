import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/controller/product_list.controller.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/mixinx/refreshable.mixin.dart';
import 'package:e_commerce/src/view/shared/product_item.widget.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductsListScreen extends GetView<ProductListcontroller>
    with RefreshableMixin {
  const ProductsListScreen({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Obx(() {
      return RequestHandler<List<Product>>(
        data: controller.products.value,
        onSuccess: (BuildContext context, List<Product> items) =>
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: SizeConfig.verticalSpace,
                    crossAxisCount: 2,
                    childAspectRatio: .7),
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
    });
  }

  @override
  Future<void> onRefresh() {
    return controller.getProducts();
  }

  @override
  VoidCallback? onLoadMore() => !controller.products.value.hasNext
      ? null
      : () {
          controller.getProducts(
            page: controller.products.value.page + 1,
          );
        };
}
