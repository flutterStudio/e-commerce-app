import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/controller/main_screen.controller.dart';
import 'package:e_commerce/src/model/main_screen_item.model.dart';
import 'package:e_commerce/src/view/mixinx/refreshable.mixin.dart';
import 'package:e_commerce/src/view/sales/components/image_element.component.dart';
import 'package:e_commerce/src/view/sales/components/images_slider.component.dart';
import 'package:e_commerce/src/view/sales/components/top_bar.component.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:e_commerce/src/view/stories/components/stories_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SalesScreen extends GetView<OfferScreenCopntroller>
    with RefreshableMixin {
  const SalesScreen({Key? key}) : super(key: key);

  Widget _salesScreenContentBuilder(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const TopBar(),
          Expanded(
            child: Obx(() {
              return RequestHandler<List<ScreenItem>>(
                data: controller.screenItems.value,
                onSuccess: (BuildContext context, List<ScreenItem> items) =>
                    _itemsBuilder(
                  context,
                  items,
                ),
                onErrorRetry: () {
                  controller.getMainScreenItems();
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _itemsBuilder(BuildContext context, List<ScreenItem> items) {
    List<ScreenItem> slider =
        items.where((e) => e.itemType == ScreenItemtype.Slider).toList();
    List<ScreenItem> banners =
        items.where((e) => e.itemType == ScreenItemtype.Item).toList();
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: SizeConfig.verticalSpace),
                  child: StoriesList(
                    height: 90,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: SizeConfig.verticalSpace),
                  child: ImagesSlider(
                    items: slider,
                  ),
                ),
                ...banners.map((e) {
                  return Container(
                    color: Theme.of(context).colorScheme.secondaryVariant,
                    margin: const EdgeInsets.symmetric(
                        vertical: SizeConfig.verticalSpace),
                    child:
                        AspectRatio(aspectRatio: 3, child: ImageItem(item: e)),
                  );
                }).toList()
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget body(context) {
    return Padding(
        padding: const EdgeInsets.all(SizeConfig.verticalSpace),
        child: _salesScreenContentBuilder(context));
  }

  @override
  Future<void> onRefresh() {
    var items = controller.getMainScreenItems();
    return items;
  }
}
