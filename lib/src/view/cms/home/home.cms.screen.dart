import 'package:e_commerce/src/service/auth_service.dart';
import 'package:e_commerce/src/view/cms/home/cms.home.controller.dart';
import 'package:e_commerce/src/view/cms/offers/cms.offers.screen.dart';
import 'package:e_commerce/src/view/cms/stories/cms.stories.controller.dart';
import 'package:e_commerce/src/view/cms/stories/cms.stories.screen.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

import '../products/cms.products.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CMSHome extends GetView<CMSHomeController> {
  CMSHome({Key? key}) : super(key: key);

  final List<Widget> pages = [
    const CMSProducts(),
    const CMSOffersScreen(),
    CMSStoriesScreen()
  ];
  final List<String> titles = ["products".tr, "offers".tr, "stories".tr];
  final List<IconData> icons = const [Icons.inventory, Icons.new_releases];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: pages.length,
                    itemBuilder: (context, index) => Obx(
                          () => ListTile(
                            title: Text(titles[index]),
                            leading: Icon(icons[index]),
                            enabled: true,
                            selected: index == controller.currentPage.value,
                            onTap: () {
                              controller.goToPage(index);
                            },
                          ),
                        )),
              ),
              const Spacer(),
              ListTile(
                title: Text("logout".tr),
                leading: const Icon(Icons.logout),
                enabled: true,
                onTap: () {
                  Get.find<AuthService>().removeUser();
                },
              ),
            ],
          ),
        ),
        body: PageView(
          controller: controller.pageController,
          children: pages,
          onPageChanged: (page) {
            controller.currentPage.value = page;
          },
        ));
  }
}
