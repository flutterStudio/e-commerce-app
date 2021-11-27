import 'package:e_commerce/src/config/size.config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String?> errors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: SizeConfig.verticalSpace * 2,
          horizontal: SizeConfig.horizontalSpace),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.error),
      child: Column(
        children: List.generate(errors.length,
            (index) => ErrorMessageText(context, error: errors[index]!)),
      ),
    );
  }

  Row ErrorMessageText(BuildContext context, {required String error}) {
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
        Text(
          error,
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: Theme.of(context).colorScheme.onError),
        ),
      ],
    );
  }
}
