import 'package:e_commerce/src/config/size.config.dart';
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
      child: Row(
        children: [
          Expanded(
            child: _statsItem(context, "min-amount".tr,
                product?.minQuantity.toString() ?? " "),
          ),
          Expanded(
            child: _statsItem(context, "available-amount".tr,
                product?.availableQuantity.toString() ?? " "),
          ),
        ],
      ),
    );
  }

  Padding _statsItem(BuildContext context, String title, String value) {
    return Padding(
      padding: EdgeInsets.only(
          right: getProportionateScreenWidth(20),
          top: getProportionateScreenWidth(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle2?.copyWith(
                color: Theme.of(context).colorScheme.secondary.withAlpha(100)),
          ),
          const SizedBox(
            height: SizeConfig.verticalSpace * 2,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
    );
  }

  double getProportionateScreenWidth(double val) {
    return val;
  }
}
