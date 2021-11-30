import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/model/cart_item.model.dart';
import 'package:e_commerce/src/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductInstance extends StatelessWidget {
  const ProductInstance({Key? key, required this.instance}) : super(key: key);
  final CartItem instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizeConfig.horizontalSpace),
      margin: const EdgeInsets.symmetric(vertical: SizeConfig.horizontalSpace),
      decoration: BoxDecoration(
          color: instance.color?.colorValue ??
              Theme.of(context).colorScheme.primaryVariant,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          _controlItem(
              context,
              Text(
                "${instance.size?.sizeValue}",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              )),
          const SizedBox(
            width: SizeConfig.horizontalSpace * 2,
          ),
          _controlItem(context, Text("${instance.count}")),
          const SizedBox(
            width: SizeConfig.horizontalSpace,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.remove,
                size: ICONSIZE.md,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                size: ICONSIZE.md,
              )),
          const Spacer(),
          _controlItem(
            context,
            GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.delete_forever,
                  size: ICONSIZE.md,
                  color: Theme.of(context).colorScheme.onPrimary,
                )),
          ),
        ],
      ),
    );
  }

  Widget _controlItem(BuildContext context, Widget child) => Container(
        padding: const EdgeInsets.all(SizeConfig.buttonPadding),
        decoration: BoxDecoration(
            color: instance.color?.colorValue?.darken(0.1),
            borderRadius: BorderRadius.circular(10)),
        child: child,
      );
}
