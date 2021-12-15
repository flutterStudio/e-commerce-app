import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/view/cms/offers/cms.offers.controller.dart';
import 'package:e_commerce/src/view/cms/offers/components/pick_products.component.dart';
import 'package:e_commerce/src/view/cms/shared/cms.form_field.widget.dart';
import 'package:e_commerce/src/view/shared/default_button.dart';
import 'package:e_commerce/src/view/shared/error_message.widget.dart';
import 'package:e_commerce/src/view/shared/file_uploader/file_uploader.dart';
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
          const SizedBox(height: SizeConfig.horizontalSpace * 2),
          Row(
            children: [
              Text("offer-view-type".tr),
              const SizedBox(width: SizeConfig.horizontalSpace * 2),
              Obx(() {
                return DropdownButton<ScreenItemtype>(
                    onChanged: (value) {
                      controller.offerType.value = value!;
                    },
                    value: controller.offerType.value,
                    items: ScreenItemtype.values
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.toString().split(".").last),
                            ))
                        .toList());
              }),
            ],
          ),
          const SizedBox(height: SizeConfig.verticalSpace * 2),
          FileUploader(
            title: "offer-attachments".tr,
            controller: controller.fileUploaderController,
          ),
          const SizedBox(height: SizeConfig.verticalSpace * 2),
          Row(
            children: [
              Text("offer-type".tr),
              const SizedBox(width: SizeConfig.horizontalSpace * 2),
              Obx(() {
                return DropdownButton<ScreenItemActionType>(
                    onChanged: (value) {
                      controller.offerActionType.value = value!;
                    },
                    value: controller.offerActionType.value,
                    items: ScreenItemActionType.values
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.toString().split(".").last),
                            ))
                        .toList());
              }),
            ],
          ),
          const SizedBox(height: SizeConfig.horizontalSpace * 2),
          Obx(() {
            return controller.offerActionType.value ==
                    ScreenItemActionType.External
                ? CMSFromField(
                    label: "textField-offer-link-label".tr,
                    hint: "textField-offer-link-hint".tr,
                    inputType: TextInputType.text,
                    validator: (value) {
                      if (controller.offerActionType.value ==
                          ScreenItemActionType.External) {
                        return GetUtils.isNullOrBlank(value)!
                            ? "textField-validation-needed"
                                .trParams({"field": "Title"})
                            : !GetUtils.isURL(value!)
                                ? "textField-validation-not-valid"
                                    .trParams({"field": "link"})
                                : null;
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.offerLink.value = value;
                    },
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("pick-offer-products".tr),
                      const SizedBox(height: SizeConfig.horizontalSpace * 2),
                      PickProducts(
                        count: controller.pickedProducts.length,
                        onPick: () async {
                          controller.pickProducts();
                        },
                      )
                    ],
                  );
          }),
          const SizedBox(height: SizeConfig.horizontalSpace * 2),
          Obx(() => ErrorMessage(errors: controller.errors.value)),
          Row(
            children: [
              Expanded(
                child: DefaultButton(
                  child: Text(
                    "continue".tr,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  press: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      controller.addOffer();
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
