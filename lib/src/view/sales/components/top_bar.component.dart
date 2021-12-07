import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/view/sales/components/icon_btn_with_counter.dart';
import 'package:e_commerce/src/view/shared/search_field/search_field.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: SizeConfig.horizontalSpace,
          vertical: SizeConfig.verticalSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 8,
              child: Hero(
                  tag: "search-field",
                  child: SearchField(
                      textEditingController: TextEditingController(),
                      onTap: () {
                        Get.toNamed("/productSearch");
                      }))),
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
