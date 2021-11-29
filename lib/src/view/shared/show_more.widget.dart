import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowMore extends StatelessWidget {
  const ShowMore({Key? key, this.onClick, required this.text, this.color})
      : super(key: key);

  final String text;
  final void Function()? onClick;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onClick,
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: color ?? Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.arrow_forward_ios,
              size: 12,
              color: color ?? Theme.of(context).colorScheme.primary,
            ),
          ],
        ));
  }
}
