import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/model/category.model.dart';
import 'package:e_commerce/src/view/cms/categories/add_category.widget.dart';
import 'package:e_commerce/src/view/cms/categories/categories.controller.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:e_commerce/src/view/shared/search_field/category_card.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CategoriesList extends GetWidget<CategoriesController> {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => WillPopScope(
        onWillPop: () async {
          Get.back(result: controller.selectedCategories);
          return true;
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: SizeConfig.verticalSpace,
              horizontal: SizeConfig.horizontalSpace * 2),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AddCategoryWidget(),
              Expanded(
                  child: RequestHandler<List<Category>>(
                      data: controller.categories.value,
                      onErrorRetry: () {
                        controller.initCategories();
                      },
                      onSuccess: (context, data) {
                        return Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: SingleChildScrollView(
                            child: Wrap(
                              runSpacing: SizeConfig.verticalSpace,
                              children: data
                                  .map((e) => Obx(() => CategoryCard(
                                        isActive:
                                            controller.isCategorySelected(e),
                                        text: e.title,
                                        press: () {
                                          controller.selectCategory(e);
                                        },
                                      )))
                                  .toList(),
                            ),
                          ),
                        );
                      })),
            ],
          ),
        )));
  }
}
