import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/controller/product.controller.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/product_details/components/color_dots.dart';
import 'package:e_commerce/src/view/product_details/components/product_description.dart';
import 'package:e_commerce/src/view/product_details/components/product_images.dart';
import 'package:e_commerce/src/view/product_details/components/product_stats.dart';
import 'package:e_commerce/src/view/product_details/components/sizes_list.widget.dart';
import 'package:e_commerce/src/view/product_details/components/top_rounded_container.dart';
import 'package:e_commerce/src/view/product_details/components/user_evaluation.widget.dart';
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
                            _SectionWidget(
                              child: ProductDescription(
                                product: data,
                                pressOnSeeMore: () {},
                              ),
                              title: data.title!,
                            ),
                            _SectionWidget(
                              child: ProductStats(product: data),
                              title: "product-details",
                            ),

                            _SectionWidget(
                              child: ColorDots(
                                product: data,
                              ),
                              title: "available-colors".tr,
                            ),
                            _SectionWidget(
                              child: const SizesList(),
                              title: "available-sizes".tr,
                            ),

                            const UserEvaluation()
                            // TopRoundedContainer(
                            //   color: Theme.of(context)
                            //       .colorScheme
                            //       .background,
                            //   child: Column(
                            //     children: [
                            //       ColorDots(
                            //         product: data,
                            //       ),
                            //       const SizesList(),
                            //       TopRoundedContainer(
                            //         color: Colors.white,
                            //         child: Padding(
                            //           padding: EdgeInsets.only(
                            //             left: MediaQuery.of(context)
                            //                     .size
                            //                     .width *
                            //                 0.15,
                            //             right: MediaQuery.of(context)
                            //                     .size
                            //                     .width *
                            //                 0.15,
                            //             bottom:
                            //                 getProportionateScreenWidth(
                            //                     40),
                            //             top: getProportionateScreenWidth(
                            //                 15),
                            //           ),
                            //           child: Obx(() {
                            //             return Row(
                            //               children: [
                            //                 Text(
                            //                   "${controller.count.value}/${controller.price.value}",
                            //                   style: Theme.of(context)
                            //                       .textTheme
                            //                       .headline4
                            //                       ?.copyWith(
                            //                           color: Theme.of(
                            //                                   context)
                            //                               .colorScheme
                            //                               .primary),
                            //                 ),
                            //                 Text(
                            //                   " USD",
                            //                   style: Theme.of(context)
                            //                       .textTheme
                            //                       .headline4,
                            //                 ),
                            //                 const Spacer(),
                            //                 DefaultButton(
                            //                   child: const Icon(
                            //                       Icons.shopping_bag),
                            //                   press: () {
                            //                     controller.addToCart();
                            //                   },
                            //                 ),
                            //               ],
                            //             );
                            //           }),
                          ],
                        ),
                      );
                      // ShowMore(
                      //   text: "Show product instances",
                      //   onClick: () {
                      //     Get.to(ProductInstances());
                      //   },
                      // ),
                      // ],
                      // ),
                      // inProgress: const RefreshProgressIndicator());
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

class _SectionWidget extends StatelessWidget {
  const _SectionWidget({
    required this.child,
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: SizeConfig.horizontalSpace * 2,
          horizontal: SizeConfig.horizontalSpace * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: SizeConfig.verticalSpace,
          ),
          child
        ],
      ),
    );
  }
}
