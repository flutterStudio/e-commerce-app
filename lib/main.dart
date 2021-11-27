import 'package:e_commerce/src/config/app.config.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/src/app.dart';

void main() async {
  await AppConfig().init();

  runApp(const Application());
}
