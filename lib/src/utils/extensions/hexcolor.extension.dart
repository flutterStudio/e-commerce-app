import 'package:flutter/cupertino.dart';

extension HexColor on Color {
  static Color? fromHex(String? hexValue) {
    if (hexValue == null) return null;
    // if (GetUtils.isHexadecimal(hexValue)) {
    hexValue = hexValue.replaceFirst("#", "0x");
    int? colorValue = int.tryParse(hexValue);
    if (colorValue == null) return null;
    return Color(colorValue);
    // }
    // return null;
  }
}
