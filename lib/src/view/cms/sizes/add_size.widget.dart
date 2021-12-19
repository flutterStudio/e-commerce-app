import 'package:e_commerce/src/view/cms/shared/cms.form_field.widget.dart';
import 'package:e_commerce/src/view/cms/sizes/sizes.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:get/get.dart';

class AddSizeWidget extends GetWidget<CMSSizesController> {
  AddSizeWidget({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
          key: formKey,
          child: Obx(() {
            return CMSFromField(
              hint: "textField-size-hint".tr,
              initialValue: controller.size.value,
              inputType: TextInputType.text,
              onChanged: (value) {
                controller.size.value = value;
              },
              edgeInsets: EdgeInsets.zero,
              suffix: IconButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      controller.addSize();
                    }
                  },
                  icon: const Icon(Icons.send)),
              validator: (value) {
                return GetUtils.isNullOrBlank(value)!
                    ? "textField-validation-needed"
                        .trParams({"field": "Size".tr})
                    : null;
              },
            );
          })),
    );
  }
}
