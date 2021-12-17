import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/model/main_screen_item.model.dart';
import 'package:e_commerce/src/utils/network.utils.dart';
import 'package:e_commerce/src/view/shared/custom_network_image.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ImageItem extends StatelessWidget {
  final ScreenItem item;

  const ImageItem({Key? key, required this.item, required this.onShowOptions})
      : super(key: key);
  final void Function() onShowOptions;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
            onTap: () {
              switch (item.actionType) {
                case ScreenItemActionType.External:
                  {
                    NetworkUtils.launchURL(item.externalLink ?? "");
                    break;
                  }
                default:
                  {
                    Get.toNamed("/productsOffer/${item.screenItemId}");
                  }
              }
            },
            child: CustomNetworkImage(url: item.image ?? "")),
        PositionedDirectional(
          start: 0,
          end: 0,
          child: Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: onShowOptions,
                icon: const Icon(
                  Icons.more_vert_outlined,
                  color: Colors.white,
                )),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black54,
                  Colors.black38,
                  Colors.black12,
                  Colors.transparent
                ])),
          ),
        ),
      ],
    );
  }
}
