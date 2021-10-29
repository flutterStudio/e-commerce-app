import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/src/controller/home_screen.controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Screen"),
      ),
      body: Center(child: Obx(() => Text("${controller.counter}"))),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increaseCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
