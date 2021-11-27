import 'dart:convert';

import 'package:e_commerce/src/config/routing/app_paths.dart';
import 'package:e_commerce/src/model/user.model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxService {
  static final AuthService _instance = AuthService._internal();

  factory AuthService() => _instance;
  AuthService._internal();
  static const String userSharedPreferenciesKey = "USER";

  Rx<User?> currentUser = Rx(null);

  // Save user using shared preferences
  void saveUser(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // Save user as json
    preferences.setString(
        userSharedPreferenciesKey, json.encode(user.serilizer().toJson()));
    currentUser.value = user;
    Get.offAllNamed(AppPaths.root);
  }

  // Save user using shared preferences
  void removeUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // Load user json string
    preferences.remove(userSharedPreferenciesKey);
    currentUser.value = null;
    Get.offAllNamed(AppPaths.login);
  }

  // Load user model
  Future<void> loadUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // Load user json string
    String? userJson = preferences.getString(userSharedPreferenciesKey);
    if (userJson != null && userJson.isNotEmpty) {
      User user = User().serilizer().fromJson(json.decode(userJson));

      currentUser.value = user;
    }
  }
}
