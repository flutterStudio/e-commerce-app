import 'package:e_commerce/src/config/routing/app_paths.dart';
import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/controller/product.controller.dart';
import 'package:e_commerce/src/model/evaluation.model.dart';
import 'package:e_commerce/src/service/auth_service.dart';
import 'package:e_commerce/src/view/evaluations/components/review_item.widget.dart';
import 'package:e_commerce/src/view/shared/show_more.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class UserEvaluation extends GetView<ProductController> {
  const UserEvaluation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: SizeConfig.verticalSpace * 2,
        ),
        Padding(
            padding: const EdgeInsets.all(SizeConfig.horizontalSpace * 2),
            child: Row(
              children: [
                Text(
                  "app-ratings".tr,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const Spacer(),
                ShowMore(
                  text: "show-all-ratings".tr,
                  onClick: () {
                    Get.toNamed(AppPaths.productEvaluations);
                  },
                )
              ],
            )),
        const SizedBox(
          height: SizeConfig.verticalSpace * 2,
        ),
        ReviewItem(
            review: Evaluation(
                user: Get.find<AuthService>().currentUser.value,
                rate: 4.5,
                comment:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam a sapien, amet, consectetur nisl ullamcorper quam aliquet. Id nisi, amet suscipit nam orci tincidunt nunc donec arcu. Gravida id ...")),
        Padding(
          padding: const EdgeInsets.all(SizeConfig.horizontalSpace * 2),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "rate-this-product".tr,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const Spacer(),
                  RatingBar(
                    itemSize: ICONSIZE.md,
                    glow: true,
                    allowHalfRating: true,
                    minRating: 1,
                    initialRating: 1,
                    unratedColor: Theme.of(context).colorScheme.secondary,
                    glowColor: Theme.of(context).colorScheme.primary,
                    ratingWidget: RatingWidget(
                        empty: const Icon(
                          Icons.star_outline_outlined,
                        ),
                        half: Icon(
                          Icons.star_half_outlined,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        full: Icon(
                          Icons.star_rate,
                          color: Theme.of(context).colorScheme.primary,
                        )),
                    onRatingUpdate: (value) {
                      controller.rate.value = value;
                    },
                  )
                ],
              ),
              reviewField()
            ],
          ),
        )
      ],
    );
  }

  Widget reviewField() => TextFormField(
        onChanged: (value) {
          controller.comment.value = value;
        },
        initialValue: controller.comment.value,
        decoration: InputDecoration(
          hintText: "textField-evaluation-hint".tr,
          fillColor: Get.theme.colorScheme.secondaryVariant,
          focusColor: Get.theme.colorScheme.secondaryVariant,
          suffix: IconButton(
              onPressed: () {
                controller.evaluateProduct();
              },
              icon: Icon(
                Icons.send,
                color: Get.theme.colorScheme.primary,
              )),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      );
}
