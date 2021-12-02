import 'package:e_commerce/src/controller/product.controller.dart';
import 'package:e_commerce/src/model/evaluation.model.dart';
import 'package:e_commerce/src/view/evaluations/components/review_item.widget.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ReviewList extends GetView<ProductController> {
  const ReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RequestHandler<List<Evaluation>>(
        data: controller.productEvaluations.value,
        onErrorRetry: () {
          controller.getProductEvaluations();
        },
        onSuccess: (context, data) => ListView.builder(
            itemCount: controller.productEvaluations.value.data?.length,
            itemBuilder: (context, index) => ReviewItem(
                  review: controller.productEvaluations.value.data![index],
                )),
        inProgress: const RefreshProgressIndicator(),
      );
    });
  }
}
