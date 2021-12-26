import 'package:e_commerce/src/config/routing/app_paths.dart';
import 'package:e_commerce/src/view/cms/products/cms.products.controller.dart';
import 'package:e_commerce/src/view/cms/products/components/cms.products_list.component.dart';
import 'package:e_commerce/src/view/mixinx/refreshable.mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CMSProducts extends GetView<CMSProductsController> with RefreshableMixin {
  const CMSProducts({Key? key}) : super(key: key);

  @override
  FloatingActionButton? floatingActionButton(BuildContext context) =>
      FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppPaths.admin + AppPaths.addProduct);
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      );
  @override
  Widget body(BuildContext context) => Column(
        children: const [
          Expanded(child: CMSProductsList()),
        ],
      );

  @override
  Future<void> onRefresh() {
    return controller.getProducts();
  }

  @override
  VoidCallback? onloadMore() {
    if (controller.products.value.hasNext) {
      controller.getProducts(page: controller.products.value.page + 1);
    } else {
      controller.refreshController.loadNoData();
    }
  }

  @override
  RefreshController refreshController() => controller.refreshController;
}
