import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/model/size.model.dart';
import 'package:e_commerce/src/view/cms/sizes/add_size.widget.dart';
import 'package:e_commerce/src/view/cms/sizes/sizes.controller.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:e_commerce/src/view/shared/size.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

class CMSSizesList extends GetWidget<CMSSizesController> {
  const CMSSizesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => WillPopScope(
          onWillPop: () async {
            Get.back(result: controller.selectedSizes);
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
                AddSizeWidget(),
                Expanded(
                  child: RequestHandler<List<Size>>(
                      data: controller.sizes.value,
                      onErrorRetry: () {
                        controller.initSizes();
                      },
                      onSuccess: (context, data) {
                        return Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: SingleChildScrollView(
                            child: Wrap(
                              runSpacing: SizeConfig.verticalSpace,
                              children: data
                                  .map((e) => Obx(() => SizeWidget(
                                        isSelected:
                                            controller.isSizeSelected(e),
                                        value: e,
                                        onSelect: () {
                                          controller.selectSize(e);
                                        },
                                      )))
                                  .toList(),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
