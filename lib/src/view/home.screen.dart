import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/src/config/theming/theming.dart';
import 'package:flutter_template/src/controller/home_screen.controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("appTitle".tr),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                ThemeConfigs.changeTheme();
              },
              icon: Icon(Get.isDarkMode ? Icons.wb_sunny : Icons.nightlight))
        ],
      ),
      body: Center(
          child: Obx(() => Text(
                "${controller.counter}",
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increaseCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
