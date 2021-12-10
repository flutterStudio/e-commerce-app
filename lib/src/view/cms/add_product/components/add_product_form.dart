import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/model/color.model.dart';
import 'package:e_commerce/src/view/cms/add_product/cms.add_product.controller.dart';
import 'package:e_commerce/src/view/cms/shared/cms.form_field.widget.dart';
import 'package:e_commerce/src/view/product_details/components/color_dots.dart';
import 'package:e_commerce/src/view/shared/default_button.dart';
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
          Row(
            children: [
              Text("product-colors".tr),
              IconButton(
                  onPressed: () => _showColorsModal(context),
                  icon: const Icon(Icons.add))
            ],
          ),
          const SizedBox(
            height: SizeConfig.verticalSpace,
          ),
          Obx(() {
            List<ColorModel> colors = controller.selectedColors!.value;
            return Wrap(
              children:
                  colors.map((e) => ColorDot(color: e.colorValue!)).toList(),
            );
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

  void _showColorsModal(BuildContext context) {
    controller.getColors();
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return RequestHandler<List<ColorModel>>(
            data: controller.availableColors.value,
            onSuccess: (context, data) => Wrap(
              children: data
                  .map((e) =>
                      GetX<CMSAddProductController>(builder: (controller) {
                        return ColorDot(
                            color: e.colorValue!,
                            isSelected: controller.iscolorSelected(e),
                            onSelected: () {
                              controller.iscolorSelected(e)
                                  ? controller.unSelectColor(e)
                                  : controller.selectColor(e);
                            });
                      }))
                  .toList(),
            ),
          );
        });
  }
}
