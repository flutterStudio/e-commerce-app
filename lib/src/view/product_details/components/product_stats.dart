import 'package:e_commerce/src/model/product.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductStats extends StatelessWidget {
  const ProductStats({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product? product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Column(
        children: [
          _statsItem(
              context, "min-amount".tr, product?.minQuantity.toString() ?? " "),
          _statsItem(context, "available-amount".tr,
              product?.availableQuantity.toString() ?? " "),
        ],
      ),
    );
  }

  Padding _statsItem(BuildContext context, String title, String value) {
    return Padding(
      padding: EdgeInsets.only(
          right: getProportionateScreenWidth(20),
          top: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const Spacer(),
          Text(
            value,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Theme.of(context).colorScheme.secondaryVariant),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  double getProportionateScreenWidth(double val) {
    return val;
  }
}
