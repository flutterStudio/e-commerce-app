import 'package:e_commerce/src/controller/product.controller.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:e_commerce/src/view/shared/size.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SizesList extends GetView<ProductController> {
  const SizesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => RequestHandler<Product>(
          data: controller.product.value,
          onSuccess: (context, data) => SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.sizes?.length ?? 0,
              itemBuilder: (context, index) => SizeWidget(
                size: data.sizes![index],
              ),
            ),
          ),
        ));
  }
}
