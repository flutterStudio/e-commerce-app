import 'package:e_commerce/src/controller/cart_screen.controller.dart';
import 'package:e_commerce/src/controller/discover_screen.controller.dart';
import 'package:e_commerce/src/controller/home_screen.controller.dart';
import 'package:e_commerce/src/controller/main_screen.controller.dart';
import 'package:e_commerce/src/controller/product_list.controller.dart';
import 'package:e_commerce/src/controller/profile.controller.dart';
import 'package:e_commerce/src/controller/stories.controller.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:e_commerce/src/service/api.service.dart';
import 'package:e_commerce/src/service/auth_service.dart';
import 'package:e_commerce/src/view/cms/add_product/cms.add_product.controller.dart';
import 'package:e_commerce/src/view/cms/products/cms.products.controller.dart';
import 'package:get/get.dart';

class AppConfig {
  static final _instance = AppConfig._internal();
  AppConfig._internal();
  factory AppConfig() => _instance;

  Future<void> init() async {
    await _initServices();
    await Get.putAsync<MainRepo>(
        () async => MainRepo(apiService: ApiService()));
    await _initControllers();
    await _initCMSControllers();
  }

  Future<void> _initCMSControllers() async {
    await Get.putAsync<CMSProductsController>(
        () async => CMSProductsController());

    await Get.putAsync<CMSAddProductController>(
        () async => CMSAddProductController());
  }

  Future<void> _initControllers() async {
    await Get.putAsync<HomeScreenController>(
        () async => HomeScreenController());

    await Get.putAsync<CartScreenController>(
        () async => CartScreenController());

    await Get.putAsync<Discovercontroller>(() async => Discovercontroller());

    await Get.putAsync<ProductListcontroller>(
        () async => ProductListcontroller());

    await Get.putAsync<OfferScreenCopntroller>(
        () async => OfferScreenCopntroller());

    await Get.putAsync<StoriesController>(() async => StoriesController());

    await Get.putAsync<ProfileController>(() async => ProfileController());
  }

  Future<void> initData() async {
    Get.find<StoriesController>().getAllCompaniesStories();
    Get.find<OfferScreenCopntroller>().getMainScreenItems();
    Get.find<Discovercontroller>().getProducts();
    Get.find<CartScreenController>().getCart();
  }

  Future<void> _initServices() async {
    var service = await Get.putAsync<AuthService>(() async => AuthService());
    await service.loadUser();
  }
}
