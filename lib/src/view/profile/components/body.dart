import 'package:e_commerce/src/config/size.config.dart';
import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: SizeConfig.verticalSpace),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "notifications".tr,
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
              text: "logout".tr,
              icon: "assets/icons/Log out.svg",
              press: () {
                Get.toNamed("Logout");
              }),
        ],
      ),
    );
  }
}
