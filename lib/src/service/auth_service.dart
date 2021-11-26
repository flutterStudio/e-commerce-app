import 'dart:convert';

import 'package:e_commerce/src/model/user.model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
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
  }

  // Save user using shared preferences
  void removeUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // Load user json string
    preferences.remove(userSharedPreferenciesKey);
    currentUser.value = null;
  }

  // Load user model
  Future<void> loadUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // Load user json string
    String? userJson = preferences.getString(userSharedPreferenciesKey);
    if (userJson != null) {
      User user = User().serilizer().fromJson(json.decode(userJson));

      currentUser.value = user;
    }
  }
}
