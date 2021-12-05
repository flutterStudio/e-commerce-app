import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/controller/product.controller.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/product_details/components/add_to_cart.widget.dart';
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
                            data.colors.isBlank!
                                ? Container()
                                : _SectionWidget(
                                    child: ColorDots(
                                      interactive: true,
                                      product: data,
                                    ),
                                    title: "available-colors".tr,
                                  ),
                            data.sizes.isBlank!
                                ? Container()
                                : _SectionWidget(
                                    child: SizesList(data),
                                    title: "available-sizes".tr,
                                  ),
                            data.availableQuantity! > 0
                                ? _SectionWidget(
                                    child: AddToCart(data),
                                    title: "add-to-cart".tr,
                                  )
                                : Container(),
                            const UserEvaluation()
                          ],
                        ),
                      );
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
    return Container(
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
