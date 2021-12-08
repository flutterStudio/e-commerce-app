import 'package:e_commerce/src/view/cms/products/components/cms.products_list.component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CMSProducts extends StatelessWidget {
  const CMSProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CMSProductsList(),
      ),
    );
  }
}
