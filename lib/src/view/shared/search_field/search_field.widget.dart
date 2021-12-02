import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget {
  SearchField({Key? key, this.onTap, this.onSubmitted}) : super(key: key);
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final TextEditingController? controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
            controller: controller,
            onChanged: (value) => {},
            onSubmitted: onSubmitted,
            onTap: onTap,
            style: Theme.of(context).textTheme.headline5,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "search-product".tr,
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  onSubmitted!(controller!.value.text);
                },
              ),
            )),
      ),
    );
  }
}
