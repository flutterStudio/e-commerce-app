import 'package:e_commerce/src/controller/product.controller.dart';
import 'package:e_commerce/src/view/evaluations/components/review_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductEvaluations extends GetView<ProductController> {
  const ProductEvaluations({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Get.back(),
          ),
          title: Text("product-details".tr),
        ),
        body: const ReviewList());
  }
}
