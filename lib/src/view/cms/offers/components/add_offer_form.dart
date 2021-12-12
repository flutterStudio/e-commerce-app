import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/view/cms/add_product/components/files_upload.dart';
import 'package:e_commerce/src/view/cms/offers/cms.offers.controller.dart';
import 'package:e_commerce/src/view/cms/shared/cms.form_field.widget.dart';
import 'package:e_commerce/src/view/shared/default_button.dart';
import 'package:e_commerce/src/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

class AddOfferForm extends GetView<CMSOfferScreenCopntroller> {
  const AddOfferForm({Key? key}) : super(key: key);

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          DefaultButton(
            child: Text(
              "pick-products".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
            press: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                // controller.addProduct();
              }
            },
          ),
          Row(
            children: [
              Text("offer-type".tr),
              DropdownButton<ScreenItemActionType>(
                  onChanged: (value) {},
                  items: ScreenItemActionType.values
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.toString().split(".").last),
                          ))
                      .toList()),
            ],
          ),
          Row(
            children: [
              Text("offer-view-type".tr),
              DropdownButton<ScreenItemtype>(
                  onChanged: (value) {},
                  items: ScreenItemtype.values
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.toString().split(".").last),
                          ))
                      .toList()),
            ],
          ),
          CMSFromField(
            label: "textField-product-title-label".tr,
            hint: "textField-product-title-hint".tr,
            inputType: TextInputType.text,
            validator: (value) {
              return GetUtils.isNullOrBlank(value)!
                  ? "textField-validation-needed".trParams({"field": "Title"})
                  : null;
            },
            onChanged: (value) {
              // controller.title.value = value;
            },
          ),
          const SizedBox(height: SizeConfig.verticalSpace * 2),
          FilesUpload(
            title: "offer-attachments".tr,
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
                // controller.addProduct();
              }
            },
          ),
        ],
      ),
    );
  }
}
