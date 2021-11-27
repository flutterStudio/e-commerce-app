import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile".tr),
      ),
      body: const Body(),
    );
  }
}
