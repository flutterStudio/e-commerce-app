import 'package:e_commerce/src/controller/cart_screen.controller.dart';
import 'package:e_commerce/src/controller/home_screen.controller.dart';
import 'package:e_commerce/src/controller/product_list.controller.dart';
import 'package:e_commerce/src/service/auth_service.dart';
import 'package:get/get.dart';

class AppConfig {
  static final _instance = AppConfig._internal();
  AppConfig._internal();
  factory AppConfig() => _instance;

  Future<void> init() async {
    await _initServices();
    await _initControllers();
  }

  Future<void> _initControllers() async {
    Get.put<HomeScreenController>(HomeScreenController());
    Get.put<CartScreenController>(CartScreenController());
    Get.put<ProductListcontroller>(ProductListcontroller());
  }

  Future<void> _initServices() async {
    Get.put<AuthService>(AuthService());
  }
}
