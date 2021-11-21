import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/controller/search_screen.controller.dart';
import 'package:e_commerce/src/view/shared/search_field/category_card.widget.dart';
import 'package:e_commerce/src/view/shared/search_field/search_field.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SearchScreen extends GetView<SearchController> {
  SearchScreen({Key? key}) : super(key: key);

  final List<String> cats = ["Gaming", "clouthes", "bags"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SizeConfig.verticalSpace),
          child: NestedScrollView(
              body: Container(),
              headerSliverBuilder: (context, _) => [
                    const SliverToBoxAdapter(
                        child: Hero(tag: "search-field", child: SearchField())),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cats.length,
                          itemBuilder: (context, index) => CategoryCard(
                            isActive: index == 2,
                            text: cats[index],
                            press: () {},
                          ),
                        ),
                      ),
                    )
                  ]),
        ),
      ),
    );
  }
}
