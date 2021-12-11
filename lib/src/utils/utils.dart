import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Utils {
  static T? enumFromString<T>(Iterable<T> values, String value) =>
      values.firstWhere(
        (type) => type.toString().split(".").last == value,
      );

  static void showSnackBar(String message,
      {Color? color,
      Color? background,
      Widget? button,
      bool showProgressIndicator = false}) {
    Get.closeCurrentSnackbar();
    Get.showSnackbar(
      GetSnackBar(
        snackStyle: SnackStyle.FLOATING,
        showProgressIndicator: showProgressIndicator,
        barBlur: 0.5,
        mainButton: button,
        messageText: Text(
          message,
          style: Get.textTheme.subtitle2
              ?.copyWith(color: color ?? Get.theme.colorScheme.onError),
        ),
        backgroundColor: background ?? Get.theme.colorScheme.error,
      ),
    );
  }
}
