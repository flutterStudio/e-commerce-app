import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionDialog extends StatelessWidget {
  final String title;
  final VoidCallback? onApprove;
  final VoidCallback? onDeny;

  const ActionDialog(
      {Key? key, required this.title, this.onApprove, this.onDeny})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("question-delete-cart-product".tr),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton.icon(
            onPressed: onApprove ??
                () {
                  Get.back(result: true);
                },
            icon: const Icon(Icons.check),
            label: Text("ok".tr)),
        TextButton.icon(
            onPressed: onDeny ??
                () {
                  Get.back(result: false);
                },
            icon: const Icon(Icons.close),
            label: Text("cancel".tr))
      ],
    );
  }
}
