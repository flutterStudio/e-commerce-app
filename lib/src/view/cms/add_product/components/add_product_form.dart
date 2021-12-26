import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/model/category.model.dart';
import 'package:e_commerce/src/model/color.model.dart';
import 'package:e_commerce/src/model/size.model.dart';
import 'package:e_commerce/src/view/cms/add_product/cms.add_product.controller.dart';
import 'package:e_commerce/src/view/cms/add_product/components/files_upload.dart';
import 'package:e_commerce/src/view/cms/categories/categories_list.dart';
import 'package:e_commerce/src/view/cms/shared/cms.form_field.widget.dart';
import 'package:e_commerce/src/view/cms/sizes/sizes_list.dart';
import 'package:e_commerce/src/view/product_details/components/color_dots.dart';
import 'package:e_commerce/src/view/shared/default_button.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:e_commerce/src/view/shared/rounded_icon_btn.dart';
import 'package:e_commerce/src/view/shared/search_field/category_card.widget.dart';
import 'package:e_commerce/src/view/shared/size.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart' as color_picker;
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
            hint: "textField-product-title-hint".tr,
            // initialValue: controller.title.value,
            inputType: TextInputType.text,
            controller: controller.titleController,
            validator: (value) {
              return GetUtils.isNullOrBlank(value)!
                  ? "textField-validation-needed".trParams({"field": "Title"})
                  : null;
            },
            // onChanged: (value) {
            //   controller.title.value = value;
            // },
          ),
          CMSFromField(
            label: "textField-product-description-label".tr,
            hint: "textField-product-description-hint".tr,
            inputType: TextInputType.multiline,
            // initialValue: controller.description.value,
            controller: controller.descritionController,
            validator: (value) {
              return GetUtils.isNullOrBlank(value)!
                  ? "textField-validation-needed"
                      .tr
                      .trParams({"field": "Description".tr})
                  : null;
            },
            // onChanged: (value) {
            //   controller.description.value = value;
            // },
          ),
          CMSFromField(
            label: "textField-product-price-label".tr,
            hint: "textField-product-price-hint".tr,
            // initialValue: controller.price.value?.toString() ?? "",
            controller: controller.priceController,
            inputType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              return GetUtils.isNullOrBlank(value)!
                  ? "textField-validation-needed"
                      .trParams({"field": "price".tr})
                  : !GetUtils.isNum(value!)
                      ? "textField-validation-not-valid-type"
                          .tr
                          .trParams({"type": "positive-numbers".tr})
                      : null;
            },
            // onChanged: (value) {
            //   controller.price.value = double.parse(value);
            // },
          ),
          CMSFromField(
            label: "textField-product-discount-label".tr,
            hint: "textField-product-discount-hint".tr,
            // initialValue: controller.discount.value?.toString() ?? "",
            controller: controller.discountController,
            inputType: TextInputType.number,
            // onChanged: (value) {
            //   controller.discount.value = double.parse(value);
            // },
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              return GetUtils.isNullOrBlank(value)!
                  ? "textField-validation-needed"
                      .trParams({"field": "discount".tr})
                  : !GetUtils.isNum(value!)
                      ? "textField-validation-not-valid-type"
                          .tr
                          .trParams({"type": "positive-numbers".tr})
                      : int.tryParse(
                                  controller.discountController.value.text)! >
                              100
                          ? "textField-validation-not-valid".trParams({
                              "field": "discount".tr,
                              "criteria": "under than 100%"
                            })
                          : null;
            },
          ),
          CMSFromField(
            label: "textField-product-min-quantity-label".tr,
            hint: "textField-product-min-quantity-hint".tr,
            inputType: TextInputType.number,
            // initialValue: controller.minQuantity.value?.toString() ?? "",
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: controller.minQuantityController,
            // onChanged: (value) {
            //   controller.minQuantity.value = int.parse(value);
            // },
            validator: (value) {
              return GetUtils.isNullOrBlank(value)!
                  ? "textField-validation-needed"
                      .tr
                      .trParams({"field": "Minimum 1uantity"})
                  : !GetUtils.isNumericOnly(value!)
                      ? "textField-validation-not-valid-type"
                          .trParams({"type": "positive numbers"})
                      : int.tryParse(controller
                                  .minQuantityController.value.text)! >
                              int.tryParse(controller
                                  .availableQuntityController.value.text)!
                          ? "textField-validation-general".trParams({
                              "field1": "Product's minimum amount",
                              "case": "more than ",
                              "field2": "available amount"
                            })
                          : null;
            },
          ),
          CMSFromField(
            label: "textField-product-available-quantity-label".tr,
            hint: "textField-product-available-quantity-hint".tr,
            // initialValue: controller.availableQuntity.value?.toString() ?? "",
            inputType: TextInputType.number,
            controller: controller.availableQuntityController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              return GetUtils.isNullOrBlank(value)!
                  ? "textField-validation-needed"
                      .tr
                      .trParams({"field": "Available 1uantity"})
                  : !GetUtils.isNumericOnly(value!)
                      ? "textField-validation-not-valid-type"
                          .trParams({"type": "positive numbers"})
                      : int.tryParse(controller
                                  .minQuantityController.value.text)! >
                              int.tryParse(controller
                                  .availableQuntityController.value.text)!
                          ? "textField-validation-general".trParams({
                              "field1": "Product's minimum amount",
                              "case": "more than ",
                              "field2": "available amount"
                            })
                          : null;
            },
            // onChanged: (value) {
            //   controller.availableQuntity.value = int.parse(value);
            // },
          ),
          const SizedBox(height: SizeConfig.verticalSpace * 2),
          Row(
            children: [
              Text(
                "product-colors".tr,
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(width: SizeConfig.verticalSpace * 2),
              RoundedIconBtn(
                  color: Theme.of(context).colorScheme.primary,
                  press: () => _showColorsModal(context),
                  background: Theme.of(context).colorScheme.primaryVariant,
                  icon: Icons.add)
            ],
          ),
          const SizedBox(
            height: SizeConfig.verticalSpace * 2,
          ),
          Obx(() {
            List<ColorModel> colors = controller.selectedColors!.value;
            return Wrap(
              children:
                  colors.map((e) => ColorDot(color: e.colorValue!)).toList(),
            );
          }),
          const SizedBox(height: SizeConfig.verticalSpace * 2),
          Row(
            children: [
              Text(
                "product-sizes".tr,
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(width: SizeConfig.verticalSpace * 2),
              RoundedIconBtn(
                color: Theme.of(context).colorScheme.primary,
                icon: Icons.add,
                background: Theme.of(context).colorScheme.primaryVariant,
                press: () async {
                  var sizes = await showModalBottomSheet(
                      context: context,
                      enableDrag: false,
                      builder: (context) => const CMSSizesList());
                  controller.selectedSizes?.value = sizes;
                },
              )
            ],
          ),
          const SizedBox(
            height: SizeConfig.verticalSpace * 2,
          ),
          Obx(() {
            List<Size> sizes = controller.selectedSizes!.value;
            return SingleChildScrollView(
              child: Wrap(
                direction: Axis.horizontal,
                runSpacing: SizeConfig.verticalSpace,
                children: sizes
                    .map((e) => SizeWidget(
                          value: e,
                          isSelected: true,
                        ))
                    .toList(),
              ),
            );
          }),
          const SizedBox(height: SizeConfig.verticalSpace * 2),
          Row(
            children: [
              Text(
                "product-categories".tr,
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(width: SizeConfig.horizontalSpace * 2),
              RoundedIconBtn(
                icon: Icons.add,
                color: Theme.of(context).colorScheme.primary,
                background: Theme.of(context).colorScheme.primaryVariant,
                press: () async {
                  var categories = await showModalBottomSheet(
                      context: context,
                      enableDrag: false,
                      builder: (context) => const CategoriesList());
                  controller.selectedCategories!.value = categories;
                },
              )
            ],
          ),
          const SizedBox(
            height: SizeConfig.verticalSpace,
          ),
          Obx(() {
            List<Category> categories = controller.selectedCategories!.value;
            return SingleChildScrollView(
              child: Wrap(
                direction: Axis.horizontal,
                runSpacing: SizeConfig.verticalSpace,
                children: categories
                    .map((e) => CategoryCard(
                          press: () {},
                          text: e.title,
                          isActive: true,
                        ))
                    .toList(),
              ),
            );
          }),
          const SizedBox(height: SizeConfig.verticalSpace * 2),
          FilesUpload(
            title: "product-attachments".tr,
            uploaderController: controller.fileUploaderController,
            onPickFiles: () {
              controller.fileUploaderController.pickFiles();
            },
          ),
          const SizedBox(height: SizeConfig.verticalSpace * 2),
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
                controller.addProduct();
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
          return Padding(
            padding: const EdgeInsets.all(SizeConfig.verticalSpace),
            child: Obx(() {
              return RequestHandler<List<ColorModel>>(
                data: controller.availableColors.value,
                onSuccess: (context, data) {
                  List<Widget> colorsList = _initColorsList(
                      context, controller.availableColors.value.data!);
                  return Column(
                    children: [
                      const SizedBox(height: SizeConfig.verticalSpace),
                      Text(
                        "select-product-colors".tr,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(height: SizeConfig.verticalSpace * 2),
                      Expanded(
                          child: Wrap(children: [
                        Wrap(children: colorsList),
                        IconButton(
                            onPressed: () {
                              Get.dialog<Color>(Dialog(
                                child: Container(
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      color_picker.ColorPicker(
                                        displayThumbColor: true,
                                        onColorChanged: (color) {
                                          controller.pickedColor.value = color;
                                        },
                                        pickerColor: Colors.white,
                                        pickerAreaBorderRadius:
                                            BorderRadius.circular(1000),
                                        paletteType:
                                            color_picker.PaletteType.hueWheel,
                                      ),
                                      DefaultButton(
                                        child: Text(
                                          "add".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimary),
                                        ),
                                        press: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                            },
                            icon: Icon(Icons.add,
                                color: Get.theme.colorScheme.primary))
                      ])),
                      DefaultButton(
                          child: Text(
                        "add-new-color",
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ))
                    ],
                  );
                },
              );
            }),
          );
        });
  }

  List<Widget> _initColorsList(BuildContext context, List<ColorModel> colors) =>
      colors
          .map((e) => GetX<CMSAddProductController>(builder: (controller) {
                bool isSelected = controller.iscolorSelected(e);
                return ColorDot(
                    color: e.colorValue!,
                    size: 50,
                    shape: BoxShape.circle,
                    isSelected: isSelected,
                    onSelected: () {
                      isSelected
                          ? controller.unSelectColor(e)
                          : controller.selectColor(e);
                    });
              }))
          .toList();
}
