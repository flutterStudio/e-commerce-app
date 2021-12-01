import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:e_commerce/src/stories/components/stories_list.widget.dart';
import 'package:e_commerce/src/view/shared/product_item.widget.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:story_view/widgets/story_view.dart';

class SalesScreen extends StatelessWidget {
  SalesScreen({Key? key}) : super(key: key);
  final List<String> assets = [
    "assets/images/backbag1.png",
    "assets/images/backbag2.png",
    "assets/images/backbag3.png",
    "assets/images/backbag4-1.png",
    "assets/images/backbag4-2.png",
    "assets/images/backbag4-3.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed("/products/3");
                    },
                    child: Image.asset("assets/images/sale_gaming.png")),
                const SizedBox(
                  height: 30,
                ),
                StoriesList(
                  stories: assets
                      .map((e) => StoryItem(Image.asset(e),
                          duration: const Duration(seconds: 3)))
                      .toList(),
                ),
                GestureDetector(
                    onTap: () {
                      Get.toNamed("/products/1");
                    },
                    child: Image.asset("assets/images/sale_purse.png")),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () {
                      Get.toNamed("/products/2");
                    },
                    child: Image.asset("assets/images/sale_backbag.png")),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemExtent: 100,
                      itemCount:
                          Get.find<MainRepo>().productRepo.demoProducts.length,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                  '/product/${Get.find<MainRepo>().productRepo.demoProducts[index].id}');
                            },
                            child: ProductCard(
                                product: Get.find<MainRepo>()
                                    .productRepo
                                    .demoProducts[index]),
                          )),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
