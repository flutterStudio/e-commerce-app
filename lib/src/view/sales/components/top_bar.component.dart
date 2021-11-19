import 'package:e_commerce/src/view/sales/components/icon_btn_with_counter.dart';
import 'package:e_commerce/src/view/sales/components/search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(flex: 8, child: SearchField()),
          const Spacer(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 2,
            press: () {},
          ),
        ],
      ),
    );
  }
}
