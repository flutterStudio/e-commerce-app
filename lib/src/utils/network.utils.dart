import 'dart:io';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class NetworkUtils {
  static void openwhatsapp(String message) async {
    String whatsapp = "+963958252701";
    String androidUrl = "whatsapp://send?phone=" + whatsapp + "&text=$message";
    String iosUrl = "https://wa.me/$whatsapp?text=${Uri.parse(message)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(iosUrl)) {
        await launch(iosUrl, forceSafariVC: false);
      } else {
        Get.snackbar("Error", "whatsapp no installed");
      }
    } else {
      // android , web
      if (await canLaunch(androidUrl)) {
        await launch(androidUrl);
      } else {
        Get.snackbar("Error", "whatsapp no installed");
      }
    }
  }

  static void launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
