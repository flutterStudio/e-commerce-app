import 'package:e_commerce/src/controller/unknown_route.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UnknownRoute extends GetView<UnknownRouteController> {
  const UnknownRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(
        onPressed: () {
          Get.back();
        },
      )),
      body: Center(
        child: Text("${controller.mesage}"),
      ),
    );
  }
}
