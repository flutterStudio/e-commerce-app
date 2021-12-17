import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/utils/extensions.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.press,
    this.color,
    required this.child,
  }) : super(key: key);
  final Widget child;
  final Function? press;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(SizeConfig.buttonPadding),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: (color ?? Theme.of(context).colorScheme.onPrimary)
              .darken(press == null ? 0 : 1),
          backgroundColor: Theme.of(context)
              .colorScheme
              .primary
              .withOpacity(press == null ? 0.3 : 1)
              .darken(press == null ? 0.4 : 0),
        ),
        onPressed: press as void Function()?,
        child: child,
      ),
    );
  }
}
