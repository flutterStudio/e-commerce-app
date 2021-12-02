import 'package:e_commerce/src/controller/product.controller.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/shared/size.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SizesList extends GetView<ProductController> {
  const SizesList(this.product, {Key? key}) : super(key: key);
  final Product? product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product?.sizes?.length ?? 0,
        itemBuilder: (context, index) => product?.sizes?[index] == null
            ? Container()
            : SizeWidget(
                onSelect: () {
                  controller.selectSize(product!.sizes![index]);
                },
                value: product!.sizes![index],
              ),
      ),
    );
  }
}
