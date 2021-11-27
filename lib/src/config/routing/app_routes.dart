import 'package:e_commerce/src/controller/cart_screen.controller.dart';
import 'package:e_commerce/src/controller/home_screen.controller.dart';

import 'package:e_commerce/src/controller/login.controller.dart';
import 'package:e_commerce/src/controller/profile.controller.dart';
import 'package:e_commerce/src/controller/search_screen.controller.dart';
import 'package:e_commerce/src/service/auth_service.dart';
import 'package:e_commerce/src/view/cart/cart_screen.dart';
import 'package:e_commerce/src/view/home/home.screen.dart';
import 'package:e_commerce/src/view/login/login.screen.dart';
import 'package:e_commerce/src/view/search/search.screen.dart';
import 'package:flutter/cupertino.dart';

import '/src/config/routing/app_paths.dart';
import '/src/controller/product.controller.dart';
import '/src/controller/product_list.controller.dart';
import '../../view/product_details/product_details.screen.dart';
import '../../view/products_list/product_list.screen.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: AppPaths.root,
      page: () => const HomeScreen(),
      middlewares: [RoutingGuards()],
      participatesInRootNavigator: true,
      preventDuplicates: true,
      binding: BindingsBuilder.put(() {
        return HomeScreenController();
      }),
    ),
    GetPage(
      name: AppPaths.login,
      page: () => const LoginScreen(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      binding: BindingsBuilder.put(() {
        return LoginController();
      }),
    ),
    GetPage(
      name: AppPaths.logout,
      page: () => const HomeScreen(),
      middlewares: [RoutingGuards()],
      participatesInRootNavigator: true,
      preventDuplicates: true,
      binding: BindingsBuilder(() {
        Get.find<ProfileController>().logOut();
      }),
    ),
    GetPage(
      name: AppPaths.homePages,
      page: () => const HomeScreen(),
      middlewares: [RoutingGuards()],
      participatesInRootNavigator: true,
      preventDuplicates: true,
      binding: BindingsBuilder(() {
        var controller = Get.find<HomeScreenController>();
        String? page = Get.parameters['page'];
        controller.goToPage(int.tryParse(
              page ?? " ",
            ) ??
            0);
      }),
    ),
    GetPage(
      name: AppPaths.productDetails,
      middlewares: [RoutingGuards()],
      page: () => const ProductScreen(),
      binding: BindingsBuilder.put(() {
        String? id = Get.parameters['id'];
        return ProductController(int.tryParse(
          id ?? " ",
        ));
      }),
    ),
    GetPage(
      middlewares: [RoutingGuards()],
      name: AppPaths.products,
      page: () => const ProductsListScreen(),
    ),
    GetPage(
      middlewares: [RoutingGuards()],
      name: AppPaths.productsType,
      page: () => const ProductsListScreen(),
      binding: BindingsBuilder.put(() {
        int type = int.tryParse(Get.parameters['type']!)!;

        return ProductListcontroller(type: type);
      }),
    ),
    GetPage(
      name: AppPaths.cart,
      middlewares: [RoutingGuards()],
      page: () => const CartScreen(),
    ),
    GetPage(
      middlewares: [RoutingGuards()],
      name: AppPaths.addToCart,
      page: () => const CartScreen(),
      binding: BindingsBuilder(() {
        int? id = int.tryParse(Get.parameters['id'] ?? " ");
        int? count = int.tryParse(Get.parameters['count'] ?? " ");
        if (id != null && count != null) {
          var controller = Get.find<CartScreenController>();
          controller.add(id, count);
        }
      }),
    ),
    GetPage(
      name: AppPaths.productsOffer,
      page: () => const ProductsListScreen(),
      binding: BindingsBuilder(() {
        int? offer = int.tryParse(Get.parameters['offer'] ?? " ");
        if (offer != null) {
          var controller = Get.find<ProductListcontroller>();
          controller.getOfferProducts(offer);
        }
      }),
    ),
    GetPage(
        name: AppPaths.productSearch,
        page: () => SearchScreen(),
        binding: BindingsBuilder.put(() => SearchController())),
  ];
}

class RoutingGuards extends GetMiddleware {
  final AuthService _service;

  RoutingGuards()
      : _service = Get.find<AuthService>(),
        super();

  @override
  RouteSettings redirect(String? route) {
    if (_service.currentUser.value == null) {
      return const RouteSettings(name: AppPaths.login);
    } else {
      return RouteSettings(name: route ?? AppPaths.root);
    }
  }
}
