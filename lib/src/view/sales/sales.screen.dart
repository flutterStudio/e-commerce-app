import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/controller/main_screen.controller.dart';
import 'package:e_commerce/src/model/main_screen_item.model.dart';
import 'package:e_commerce/src/view/request_handler.dart';
import 'package:e_commerce/src/view/sales/components/image_element.component.dart';
import 'package:e_commerce/src/view/sales/components/images_slider.component.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SalesScreen extends GetView<OfferScreenCopntroller> {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => _salesScreenContentBuilder(context);

  Widget _salesScreenContentBuilder(BuildContext context) {
    return Center(
      child: Obx(() {
        return RequestHandler<List<ScreenItem>>(
          data: controller.screenItems.value,
          onSuccess: (BuildContext context, List<ScreenItem> items) =>
              _itemsBuilder(
            context,
            items,
          ),
        );
      }),
    );
  }

  Widget _itemsBuilder(BuildContext context, List<ScreenItem> items) {
    List<ScreenItem> slider =
        items.where((e) => e.itemType == ScreenItemtype.Slider).toList();
    List<ScreenItem> banners =
        items.where((e) => e.itemType == ScreenItemtype.Banner).toList();
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 200,
                  child: ImagesSlider(
                    items: slider,
                  ),
                ),
                ...banners.map((e) {
                  return ImageItem(item: e);
                }).toList()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
