import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/controller/search_screen.controller.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/shared/product_item.widget.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:e_commerce/src/view/shared/search_field/category_card.widget.dart';
import 'package:e_commerce/src/view/shared/search_field/search_field.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: controller.pickingMode.value
          ? AppBar(
              leading: IconButton(
                icon: Icon(Icons.check, color: Get.theme.colorScheme.onPrimary),
                onPressed: () {
                  Get.back(result: controller.pickedProducts);
                },
              ),
              title: Text("pick-products".tr),
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SizeConfig.verticalSpace),
          child: NestedScrollView(
              body: Obx(() {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: SizeConfig.verticalSpace * 2),
                  child: RequestHandler<List<Product>>(
                    data: controller.products.value,
                    onSuccess: (BuildContext context, List<Product> items) =>
                        GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.7),
                            itemCount: items.length,
                            itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {
                                    Get.toNamed("/product/${items[index].id}");
                                  },
                                  child: Obx(() {
                                    return ProductCard(
                                      selectable: controller.pickingMode.value,
                                      isSelected:
                                          controller.pickingMode.value &&
                                              controller.isPicked(items[index]),
                                      product: items[index],
                                      onSelected: (value) {
                                        value!
                                            ? controller
                                                .pickProduct(items[index])
                                            : controller
                                                .unPickProduct(items[index]);
                                      },
                                    );
                                  }),
                                )),
                  ),
                );
              }),
              headerSliverBuilder: (context, _) => [
                    SliverToBoxAdapter(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: SizeConfig.horizontalSpace,
                          vertical: SizeConfig.verticalSpace),
                      child: Hero(
                          tag: "search-field",
                          child: SearchField(
                            textEditingController:
                                controller.textEditingController,
                            onSubmitted: (value) {
                              controller.searchProduct(value);
                            },
                          )),
                    )),
                    SliverToBoxAdapter(
                      child: GetX<SearchController>(builder: (controller) {
                        return Container(
                          padding: const EdgeInsets.only(top: 10),
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.categories.value.length,
                            itemBuilder: (context, index) =>
                                GetX<SearchController>(
                                    builder: (controller) => CategoryCard(
                                          isActive: controller
                                                  .selectedCategory.value ==
                                              controller
                                                  .categories.value[index],
                                          text: controller
                                              .categories.value[index].title,
                                          press: () {
                                            controller.changeCategory(controller
                                                .categories.value[index]);
                                          },
                                        )),
                          ),
                        );
                      }),
                    )
                  ]),
        ),
      ),
    );
  }
}
