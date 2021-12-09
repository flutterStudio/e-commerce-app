import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/cms/add_product/cms.add_product.controller.dart';
import 'package:e_commerce/src/view/cms/shared/cms.form_field.widget.dart';
import 'package:e_commerce/src/view/shared/default_button.dart';
import 'package:e_commerce/src/view/shared/error_message.widget.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

class AddProductForm extends GetView<CMSAddProductController> {
  const AddProductForm({Key? key}) : super(key: key);

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CMSFromField(
            label: "textField-product-title-label".tr,
            validator: (value) {
              return null;
            },
          ),
          CMSFromField(
            label: "textField-product-description-label".tr,
          ),
          CMSFromField(
            label: "textField-product-price-label".tr,
          ),
          CMSFromField(
            label: "textField-product-discount-label".tr,
          ),
          CMSFromField(
            label: "textField-product-min-quantity-label".tr,
          ),
          CMSFromField(
            label: "textField-product-available-quantity-label".tr,
          ),
          Obx(() {
            return RequestHandler<Product>(
                onSuccess: (context, value) {
                  return const Text("Logged in successfully");
                },
                onFailed: (error) => ErrorMessage(
                      errors: [error],
                    ),
                data: controller.loginStatus.value);
          }),
          const SizedBox(height: 20),
          DefaultButton(
            child: Text(
              "continue".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
            press: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                // controller.login();
              }
            },
          ),
        ],
      ),
    );
  }
}
