import 'package:e_commerce/src/controller/product.controller.dart';
import 'package:e_commerce/src/view/product_details/components/review_item.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ReviewList extends GetView<ProductController> {
  const ReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          itemCount: controller.productEvaluations.value.data?.length,
          itemBuilder: (context, index) => ReviewItem(
                review: controller.productEvaluations.value.data![index],
              ));
    });
  }
}
