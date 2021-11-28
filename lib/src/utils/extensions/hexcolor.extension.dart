import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

extension HexColor on Color {
  static Color? fromHex(String hexValue) {
    if (GetUtils.isHexadecimal(hexValue)) {
      hexValue = hexValue.replaceFirst("#", "0xff");
      int? colorValue = int.tryParse(hexValue);
      if (colorValue == null) return null;
      return Color(colorValue);
    }
    return null;
  }
}
