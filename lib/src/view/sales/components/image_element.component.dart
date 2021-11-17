import 'package:e_commerce/src/model/main_screen_item.model.dart';
import 'package:e_commerce/src/view/shared/custom_network_image.widget.dart';
import 'package:flutter/cupertino.dart';

class ImageItem extends StatelessWidget {
  final ScreenItem item;

  const ImageItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Get.toNamed("/products/1");
        },
        child: CustomNetworkImage(url: item.image ?? ""));
  }
}
