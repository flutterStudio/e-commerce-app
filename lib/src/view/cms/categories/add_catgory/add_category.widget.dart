import 'package:e_commerce/src/view/cms/categories/add_catgory/add_category.controller.dart';
import 'package:e_commerce/src/view/cms/shared/cms.form_field.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:get/get.dart';

class AddCategoryWidget extends GetWidget<AddCategoryController> {
  AddCategoryWidget({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(
        children: [
          Obx(() {
            return CMSFromField(
              label: "textField-category-label".tr,
              hint: "textField-category-hint".tr,
              initialValue: controller.category.value,
              inputType: TextInputType.text,
              onChanged: (value) {
                controller.category.value = value;
              },
              suffix: IconButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      controller.addedCategory();
                    }
                  },
                  icon: const Icon(Icons.send)),
              validator: (value) {
                return GetUtils.isNullOrBlank(value)!
                    ? "textField-validation-needed"
                        .trParams({"field": "Categoy"})
                    : null;
              },
            );
          })
        ],
      ),
    );
  }
}
