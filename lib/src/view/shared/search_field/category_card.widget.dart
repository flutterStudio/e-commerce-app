import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final bool? isActive;
  const CategoryCard({
    Key? key,
    this.icon,
    required this.text,
    required this.press,
    this.isActive = false,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: isActive!
                    ? Theme.of(context).colorScheme.primaryVariant
                    : Theme.of(context).colorScheme.secondaryVariant,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                text!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: isActive!
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
