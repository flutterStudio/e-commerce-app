import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/view/shared/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    Key? key,
    required this.errors,
    this.onRetry,
  }) : super(key: key);

  final List<String?> errors;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: SizeConfig.verticalSpace,
          horizontal: SizeConfig.horizontalSpace),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.error),
      child: Column(
        children: List.generate(errors.length,
            (index) => _errorMessageText(context, error: errors[index]!)),
      ),
    );
  }

  Row _errorMessageText(BuildContext context, {required String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: 14,
          width: 14,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            error,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: Theme.of(context).colorScheme.onError),
          ),
        ),
        onRetry != null
            ? DefaultButton(
                child: Text("retry".tr),
                press: onRetry,
              )
            : Container(),
      ],
    );
  }
}
