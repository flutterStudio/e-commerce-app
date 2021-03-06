import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/model/main_screen_item.model.dart';
import 'package:e_commerce/src/utils/network.utils.dart';
import 'package:e_commerce/src/view/shared/custom_network_image.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';

class ImageItem extends StatelessWidget {
  final ScreenItem item;

  const ImageItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        child: CustomNetworkImage(url: item.image ?? ""));
  }
}
