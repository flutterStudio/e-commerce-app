import 'package:e_commerce/src/controller/home_screen.controller.dart';
import 'package:e_commerce/src/view/cart/cart_screen.dart';
import 'package:e_commerce/src/view/discover/discover.screen.dart';
import 'package:e_commerce/src/view/sales/sales.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: PersistentTabView(
          context,
          controller: controller.pageController,
          screens: [
            SalesScreen(),
            const CartScreen(),
            const DiscoverScreen(),
          ],
          items: [
            PersistentBottomNavBarItem(
              icon: const Icon(Icons.table_rows_rounded),
              title: "Sales",
              activeColorPrimary: Theme.of(context).colorScheme.primary,
              inactiveColorPrimary: Theme.of(context).colorScheme.secondary,
            ),
            PersistentBottomNavBarItem(
                onPressed: (context) {
                  Get.toNamed("/cart");
                },
                activeColorPrimary: Theme.of(context).colorScheme.primary,
                inactiveColorPrimary: Theme.of(context).colorScheme.secondary,
                inactiveColorSecondary:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                icon: const Icon(Icons.shopping_bag_sharp),
                title: "Cart"),
            PersistentBottomNavBarItem(
                icon: const Icon(Icons.production_quantity_limits),
                activeColorPrimary: Theme.of(context).colorScheme.primary,
                inactiveColorPrimary: Theme.of(context).colorScheme.secondary,
                title: "Our Products"),
          ],
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: false,
          popActionScreens: PopActionScreensType.once,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style12,
        ),
      ),
    ));
  }
}
