import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef OnColorChanged = void Function(Color color);

class ColorSelectionWidget extends StatelessWidget {
  const ColorSelectionWidget({Key? key, this.value, this.onColorChanged})
      : super(key: key);
  final Color? value;
  final OnColorChanged? onColorChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.05,
      height: Get.width * 0.05,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).colorScheme.secondary)),
    );
  }
}
