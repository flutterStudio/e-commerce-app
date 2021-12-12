import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CMSHomeController extends GetxController {
  Rx<int> currentPage = Rx(0);
  PageController pageController = PageController();
  void goToPage(int page) {
    currentPage.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
  }
}
