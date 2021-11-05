import 'package:e_commerce/src/controller/product.controller.dart';
import 'package:e_commerce/src/view/product/components/color_dots.dart';
import 'package:e_commerce/src/view/product/components/product_description.dart';
import 'package:e_commerce/src/view/product/components/product_images.dart';
import 'package:e_commerce/src/view/product/components/top_rounded_container.dart';
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
      ),
      body: ListView(
        children: [
          Obx(() => controller.product == null
              ? const Text("No images")
              : ProductImages(product: controller.product!.value!)),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                Obx(
                  () {
                    return controller.product == null
                        ? const Text("No descripion")
                        : ProductDescription(
                            product: controller.product!.value!,
                            pressOnSeeMore: () {},
                          );
                  },
                ),
                TopRoundedContainer(
                  color: const Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      controller.product == null
                          ? const Text("No colors")
                          : ColorDots(
                              product: controller.product!.value!,
                            ),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.15,
                            right: MediaQuery.of(context).size.width * 0.15,
                            bottom: getProportionateScreenWidth(40),
                            top: getProportionateScreenWidth(15),
                          ),
                          // child: DefaultButton(
                          //   text: "Add To Cart",
                          //   press: () {},
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double getProportionateScreenWidth(double val) {
    return val;
  }
}
