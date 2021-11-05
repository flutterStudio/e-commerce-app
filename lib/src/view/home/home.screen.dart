import 'package:e_commerce/src/view/shared/product_item.widget.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
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
                            itemCount: Get.find<MainRepo>()
                                .productRepo
                                .demoProducts
                                .length,
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
          ),
        ),
      ),
    );
  }
}
