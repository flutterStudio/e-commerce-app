import 'package:e_commerce/src/model/main_screen_item.model.dart';
import 'package:e_commerce/src/view/sales/components/image_element.component.dart';
import 'package:flutter/material.dart';

class ImagesSlider extends StatelessWidget {
  final List<ScreenItem> items;

  const ImagesSlider({Key? key, required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return items.isNotEmpty
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) => ImageItem(item: items[index]))
        : Container();
  }
}
