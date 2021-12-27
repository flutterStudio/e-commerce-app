import 'package:e_commerce/src/view/cms/add_product/components/add_product_form.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CMSAddProduct extends StatelessWidget {
  const CMSAddProduct({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add-product".tr),
      ),
      body: const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: AddProductForm(),
          ),
        ),
      ),
    );
  }
}
