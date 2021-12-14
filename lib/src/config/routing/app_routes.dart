import 'package:e_commerce/src/config/app.config.dart';
import 'package:e_commerce/src/controller/cart_screen.controller.dart';
import 'package:e_commerce/src/controller/discover_screen.controller.dart';
import 'package:e_commerce/src/controller/home_screen.controller.dart';

import 'package:e_commerce/src/controller/login.controller.dart';
import 'package:e_commerce/src/controller/profile.controller.dart';
import 'package:e_commerce/src/controller/search_screen.controller.dart';
import 'package:e_commerce/src/service/auth_service.dart';
import 'package:e_commerce/src/view/cart/cart_screen.dart';
import 'package:e_commerce/src/view/cms/add_product/cms.add_product.controller.dart';
import 'package:e_commerce/src/view/cms/add_product/cms.add_product.screen.dart';
import 'package:e_commerce/src/view/cms/home/home.cms.screen.dart';
import 'package:e_commerce/src/view/cms/offers/cms.add_offer.screen.dart';
import 'package:e_commerce/src/view/cms/offers/cms.offers.controller.dart';
import 'package:e_commerce/src/view/cms/products/cms.products.screen.dart';
import 'package:e_commerce/src/view/evaluations/evaluations.screen.dart';
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
      middlewares: [AuthGuard()],
      participatesInRootNavigator: true,
      preventDuplicates: true,
      binding: BindingsBuilder.put(() {
        AppConfig().initData();
        return HomeScreenController();
      }),
    ),
    GetPage(
        name: AppPaths.admin,
        page: () => CMSHome(),
        participatesInRootNavigator: true,
        preventDuplicates: true,
        children: [
          GetPage(
            name: AppPaths.products,
            page: () => const CMSProducts(),
            participatesInRootNavigator: true,
            preventDuplicates: true,
          ),
          GetPage(
            name: AppPaths.addProduct,
            page: () => const CMSAddProduct(),
            participatesInRootNavigator: true,
            preventDuplicates: true,
            binding: BindingsBuilder.put(() {
              return CMSAddProductController();
            }),
          ),
          GetPage(
            name: AppPaths.addOffer,
            page: () => const CMSAddOfferScreen(),
            participatesInRootNavigator: true,
            preventDuplicates: true,
            binding: BindingsBuilder.put(() {
              return CMSOfferScreenCopntroller();
            }),
          ),
          GetPage(
            name: AppPaths.pickProducts,
            page: () => const SearchScreen(),
            participatesInRootNavigator: true,
            preventDuplicates: true,
            binding: BindingsBuilder.put(() {
              return SearchController.pick();
            }),
          ),
        ]),
    GetPage(
      name: AppPaths.login,
      middlewares: [AuthGuard()],
      page: () => const LoginScreen(),
      participatesInRootNavigator: false,
      preventDuplicates: true,
      binding: BindingsBuilder.put(() {
        return LoginController();
      }),
    ),
    GetPage(
      name: AppPaths.logout,
      page: () => const HomeScreen(),
      middlewares: [AuthGuard()],
      participatesInRootNavigator: true,
      preventDuplicates: true,
      binding: BindingsBuilder(() {
        Get.find<ProfileController>().logOut();
      }),
    ),
    GetPage(
      name: AppPaths.homePages,
      page: () => const HomeScreen(),
      middlewares: [AuthGuard()],
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
      middlewares: [AuthGuard()],
      page: () => const ProductScreen(),
      binding: BindingsBuilder.put(() {
        String? id = Get.parameters['id'];
        return ProductController(int.tryParse(
          id ?? " ",
        ));
      }),
    ),
    GetPage(
      name: AppPaths.productEvaluations,
      middlewares: [AuthGuard()],
      page: () => const ProductEvaluations(),
      binding: BindingsBuilder(() {
        Get.find<ProductController>().getProductEvaluations();
      }),
    ),
    GetPage(
      name: AppPaths.products,
      middlewares: [AuthGuard()],
      page: () => const ProductsListScreen(),
      binding: BindingsBuilder.put(() {
        return ProductListcontroller();
      }),
    ),
    GetPage(
      name: AppPaths.productDiscover,
      middlewares: [AuthGuard()],
      page: () => const ProductsListScreen(),
      binding: BindingsBuilder.put(() {
        return Discovercontroller();
      }),
    ),
    GetPage(
      name: AppPaths.productsType,
      middlewares: [AuthGuard()],
      page: () => const ProductsListScreen(),
      binding: BindingsBuilder.put(() {
        int type = int.tryParse(Get.parameters['type']!)!;

        return ProductListcontroller(type: type);
      }),
    ),
    GetPage(
      name: AppPaths.cart,
      middlewares: [AuthGuard()],
      page: () => const CartScreen(),
    ),
    GetPage(
      name: AppPaths.addToCart,
      middlewares: [AuthGuard()],
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
      middlewares: [AuthGuard()],
      binding: BindingsBuilder(() {
        int? offer = int.tryParse(Get.parameters['offer'] ?? " ");
        if (offer != null) {
          Get.find<ProductListcontroller>().getOfferProducts(offer);
        }
      }),
    ),
    GetPage(
        name: AppPaths.productSearch,
        middlewares: [AuthGuard()],
        page: () => const SearchScreen(),
        binding: BindingsBuilder.put(() => SearchController())),
  ];
}

class AuthGuard extends GetMiddleware {
  final AuthService _service;

  AuthGuard()
      : _service = Get.find<AuthService>(),
        super();

  @override
  RouteSettings? redirect(String? route) {
    if (_service.currentUser.value == null && route != AppPaths.login) {
      // Get.resetRootNavigator();
      return const RouteSettings(
        name: AppPaths.login,
      );
    } else {
      return null;
    }
  }
}
