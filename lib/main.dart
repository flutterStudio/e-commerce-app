import 'package:e_commerce/src/config/app.config.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig().init();

  runApp(const Application());

  /// TODOS:
  /// TODO: [] Use stream with file pickere
  /// TODO: [] Use cached network image.
  /// TODO: [] show video thumbnail.
  /// TODO: [] implement pagination mixin.
}
