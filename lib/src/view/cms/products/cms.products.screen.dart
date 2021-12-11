import 'package:e_commerce/src/config/routing/app_paths.dart';
import 'package:e_commerce/src/view/cms/products/components/cms.products_list.component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CMSProducts extends StatelessWidget {
  const CMSProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppPaths.admin + AppPaths.addProduct);
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      body: const Center(
        child: CMSProductsList(),
      ),
    );
  }
}