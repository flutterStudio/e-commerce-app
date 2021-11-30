import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/model/size.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeWidget extends StatelessWidget {
  final bool isSelected;
  final Size size;
  const SizeWidget({Key? key, this.isSelected = false, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return size.sizeValue == null
        ? Container()
        : Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(
                horizontal: SizeConfig.horizontalSpace),
            padding: const EdgeInsets.all(SizeConfig.horizontalSpace),
            child: Text(
              size.sizeValue!,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : const Color(0xffC5C5C5)),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width: 2,
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : const Color(0xffC5C5C5)),
                color: isSelected
                    ? Theme.of(context).colorScheme.primaryVariant
                    : Theme.of(context).colorScheme.background),
          );
  }
}
