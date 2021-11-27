import 'package:e_commerce/src/controller/cart_screen.controller.dart';
import 'package:e_commerce/src/controller/home_screen.controller.dart';
import 'package:e_commerce/src/controller/main_screen.controller.dart';
import 'package:e_commerce/src/controller/product_list.controller.dart';
import 'package:e_commerce/src/controller/profile.controller.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:e_commerce/src/service/api.service.dart';
import 'package:e_commerce/src/service/auth_service.dart';
import 'package:get/get.dart';

class AppConfig {
  static final _instance = AppConfig._internal();
  AppConfig._internal();
  factory AppConfig() => _instance;

  Future<void> init() async {
    await _initServices();
    await _initControllers();
    Get.put<MainRepo>(MainRepo(apiService: ApiService()));
  }

  Future<void> _initControllers() async {
    Get.put<HomeScreenController>(HomeScreenController());
    Get.put<CartScreenController>(CartScreenController());
    Get.put<ProductListcontroller>(ProductListcontroller());
    Get.put<OfferScreenCopntroller>(OfferScreenCopntroller());
    Get.put<ProfileController>(ProfileController());
  }

  Future<void> _initServices() async {
    Get.put<AuthService>(AuthService());
  }
}
