import 'package:e_commerce/src/controller/product.controller.dart';
import 'package:e_commerce/src/model/evaluation.model.dart';
import 'package:e_commerce/src/service/auth_service.dart';
import 'package:e_commerce/src/view/product_details/components/review_item.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/instance_manager.dart';

class UserEvaluation extends GetView<ProductController> {
  const UserEvaluation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReviewItem(
            review: Evaluation(
                user: Get.find<AuthService>().currentUser.value,
                rate: 4.5,
                comment:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam a sapien, amet, consectetur nisl ullamcorper quam aliquet. Id nisi, amet suscipit nam orci tincidunt nunc donec arcu. Gravida id ..."))
      ],
    );
  }
}
