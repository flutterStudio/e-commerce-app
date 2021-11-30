import 'package:e_commerce/src/controller/product.controller.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/product_details/components/color_dots.dart';
import 'package:e_commerce/src/view/product_details/components/product_description.dart';
import 'package:e_commerce/src/view/product_details/components/product_images.dart';
import 'package:e_commerce/src/view/product_details/components/product_stats.dart';
import 'package:e_commerce/src/view/product_details/components/top_rounded_container.dart';
import 'package:e_commerce/src/view/product_details/components/user_evaluation.widget.dart';
import 'package:e_commerce/src/view/shared/default_button.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductScreen extends GetView<ProductController> {
  const ProductScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Get.back(),
        ),
        title: Obx(() => Text(controller.product.value.data?.title ?? "")),
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(() => RequestHandler<Product>(
                      data: controller.product.value,
                      onSuccess: (context, data) =>
                          ProductImages(product: data),
                      inProgress: const RefreshProgressIndicator(),
                    )),
                TopRoundedContainer(
                    color: Colors.white,
                    child: Obx(() {
                      return RequestHandler<Product>(
                          data: controller.product.value,
                          onSuccess: (context, data) => Column(
                                children: [
                                  ProductDescription(
                                    product: data,
                                    pressOnSeeMore: () {},
                                  ),
                                  ProductStats(product: data),
                                  TopRoundedContainer(
                                    color: const Color(0xFFF6F7F9),
                                    child: Column(
                                      children: [
                                        ColorDots(
                                          product: data,
                                        ),
                                        TopRoundedContainer(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.15,
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.15,
                                              bottom:
                                                  getProportionateScreenWidth(
                                                      40),
                                              top: getProportionateScreenWidth(
                                                  15),
                                            ),
                                            child: Obx(() {
                                              return Row(
                                                children: [
                                                  Text(
                                                    "${controller.count.value}/${controller.price.value}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4
                                                        ?.copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary),
                                                  ),
                                                  Text(
                                                    " USD",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4,
                                                  ),
                                                  const Spacer(),
                                                  DefaultButton(
                                                    child: const Icon(
                                                        Icons.shopping_bag),
                                                    press: () {
                                                      controller.addToCart();
                                                    },
                                                  ),
                                                ],
                                              );
                                            }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const UserEvaluation()
                                ],
                              ),
                          inProgress: const RefreshProgressIndicator());
                    })),
              ],
            ),
          ))
        ],
      ),
    );
  }

  double getProportionateScreenWidth(double val) {
    return val;
  }
}
