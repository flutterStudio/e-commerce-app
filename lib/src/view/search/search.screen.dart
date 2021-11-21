import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/controller/search_screen.controller.dart';
import 'package:e_commerce/src/view/shared/search_field.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SizeConfig.verticalSpace),
          child: NestedScrollView(
              body: Container(),
              headerSliverBuilder: (context, _) => const [
                    (SliverToBoxAdapter(
                        child: Hero(tag: "search-field", child: SearchField())))
                  ]),
        ),
      ),
    );
  }
}
