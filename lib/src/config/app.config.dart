import 'package:flutter_template/src/controller/home_screen.controller.dart';
import 'package:get/get.dart';

class AppConfig {
  static final _instance = AppConfig._internal();
  AppConfig._internal();
  factory AppConfig() => _instance;

  Future<void> init() async {
    await _initControllers();
  }

  Future<void> _initControllers() async {
    Get.put<HomeScreenController>(HomeScreenController());
  }
}
