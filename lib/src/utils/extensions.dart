import 'package:flutter/cupertino.dart';

extension ObjectExtension on Object? {
  bool isNullOrEmpty() => this == null
      ? true
      : this is String
          ? this == "" || (this as String).isEmpty
          : this is Iterable
              ? (this as Iterable).isEmpty
              : this is Map
                  ? (this as Map).isEmpty
                  : false;
}

extension CustomColor on Color {
  static Color? fromHex(String? hexValue) {
    if (hexValue == null) return null;
    // if (GetUtils.isHexadecimal(hexValue)) {
    hexValue = hexValue.replaceFirst("#", "0xff");
    int? colorValue = int.tryParse(hexValue);
    if (colorValue == null) return null;
    return Color(colorValue);
    // }
    // return null;
  }

  Color? darken(double value) {
    HSLColor color = HSLColor.fromColor(this);

    return color
        .withLightness(
            color.lightness - value >= 0.0 ? color.lightness - value : 0.0)
        .toColor();
  }
}
