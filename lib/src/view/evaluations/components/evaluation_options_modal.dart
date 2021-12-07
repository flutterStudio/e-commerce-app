import 'package:e_commerce/src/config/size.config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EvaluationOptionse extends StatelessWidget {
  const EvaluationOptionse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [_option(context, Icons.delete, "delete-review".tr, () {})],
    );
  }

  Widget _option(
      BuildContext context, IconData icon, String text, VoidCallback action) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: SizeConfig.verticalSpace),
      child: Row(
        children: [
          Icon(
            icon,
            size: ICONSIZE.lg,
          ),
          const SizedBox(
            width: SizeConfig.horizontalSpace * 2,
          )
        ],
      ),
    );
  }
}
