import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/model/size.model.dart';
import 'package:e_commerce/src/view/cms/add_product/cms.add_product.controller.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:e_commerce/src/view/shared/size.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

class SelectSizeWidget extends GetWidget<CMSAddProductController> {
  const SelectSizeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: SizeConfig.verticalSpace),
      Text(
        "select-product-sizes".tr,
        style: Theme.of(context).textTheme.headline4,
      ),
      const SizedBox(height: SizeConfig.verticalSpace * 2),
      Expanded(child: Obx(() {
        return RequestHandler<List<Size>>(
          data: controller.availableSizes.value,
          onSuccess: (context, data) => Wrap(
            runSpacing: SizeConfig.verticalSpace,
            children: data
                .map((e) => Obx(() {
                      bool isSelected = controller.isSizeSelected(e);
                      return SizeWidget(
                          value: e,
                          isSelected: isSelected,
                          onSelect: () {
                            isSelected
                                ? controller.unSelectSize(e)
                                : controller.selectSize(e);
                          });
                    }))
                .toList(),
          ),
        );
      }))
    ]);
  }
}
