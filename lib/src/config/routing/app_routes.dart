import 'package:e_commerce/src/controller/home_screen.controller.dart';
import 'package:e_commerce/src/view/cart/cart_screen.dart';
import 'package:e_commerce/src/view/home/home.screen.dart';

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
      participatesInRootNavigator: true,
      preventDuplicates: true,
    ),
    GetPage(
      name: AppPaths.homePages,
      page: () => const HomeScreen(),
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
      page: () => const ProductScreen(),
      binding: BindingsBuilder.put(() {
        String? id = Get.parameters['id'];
        return ProductController(int.tryParse(
          id ?? " ",
        ));
      }),
    ),
    GetPage(
      name: AppPaths.products,
      page: () => const ProductsListScreen(),
    ),
    GetPage(
      name: AppPaths.productsType,
      page: () => const ProductsListScreen(),
      binding: BindingsBuilder.put(() {
        int type = int.tryParse(Get.parameters['type']!)!;

        return ProductListcontroller(type: type);
      }),
    ),
    GetPage(
      name: AppPaths.cart,
      page: () => const CartScreen(),
    ),
  ];
}
