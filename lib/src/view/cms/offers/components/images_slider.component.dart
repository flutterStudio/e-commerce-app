import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/src/model/main_screen_item.model.dart';
import 'package:e_commerce/src/view/cms/offers/components/image_element.component.dart';
import 'package:flutter/material.dart';

class ImagesSlider extends StatelessWidget {
  final List<ScreenItem> items;

  const ImagesSlider({Key? key, required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return items.isNotEmpty
        ? CarouselSlider.builder(
            itemCount: items.length,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
              aspectRatio: 2,
              initialPage: 2,
            ),
            itemBuilder: (BuildContext context, int itemIndex,
                    int pageViewIndex) =>
                itemIndex > items.length
                    ? IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                    : ImageItem(item: items[itemIndex]))
        : Container();
  }
}
