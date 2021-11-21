import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          onChanged: (value) => {},
          onTap: onTap,
          style: Theme.of(context).textTheme.headline5,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "search-product".tr,
              prefixIcon: const Icon(Icons.search)),
        ),
      ),
    );
  }
}
