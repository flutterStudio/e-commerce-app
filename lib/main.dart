import 'package:e_commerce/src/config/app.config.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:e_commerce/src/service/api.service.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/src/app.dart';
import 'package:get/get.dart';

void main() async {
  Get.put<MainRepo>(MainRepo(apiService: ApiService()));
  await AppConfig().init();

  runApp(const Application());
}
