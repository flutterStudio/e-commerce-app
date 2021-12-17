import 'package:e_commerce/src/model/main_screen_item.model.dart';
import 'package:e_commerce/src/view/cms/offers/cms.offers.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferOptionsList extends GetView<CMSOfferScreenCopntroller> {
  const OfferOptionsList(this.item, {Key? key}) : super(key: key);
  final ScreenItem item;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(Icons.delete),
          title: Text(
              "delete-item".trParams({"item": "Offer ${item.screenItemId}"})),
          onTap: item.screenItemId != null
              ? () {
                  controller.deleteOffer(item.screenItemId!);
                }
              : null,
        ),
      ],
    );
  }
}
