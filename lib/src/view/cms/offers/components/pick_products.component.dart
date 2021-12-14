import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/view/cms/offers/cms.offers.controller.dart';
import 'package:e_commerce/src/view/shared/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PickProducts extends StatelessWidget {
  const PickProducts({Key? key, this.count = 0, this.onShowitems, this.onPick})
      : super(key: key);

  final int count;
  final void Function()? onShowitems;
  final void Function()? onPick;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizeConfig.verticalSpace),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryVariant,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                "pick-products".tr,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Expanded(child: Container()),
              GetX<CMSOfferScreenCopntroller>(builder: (controller) {
                return Text(
                  "${controller.pickedProducts.length} " + "picked".tr,
                  style: Theme.of(context).textTheme.bodyText2,
                );
              })
            ],
          ),
          const SizedBox(
            height: SizeConfig.verticalSpace * 2,
          ),
          Row(
            children: [
              Expanded(
                child: DefaultButton(
                  child: Text(
                    "pick".tr,
                    style: Theme.of(context).textTheme.button?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  press: onPick,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
