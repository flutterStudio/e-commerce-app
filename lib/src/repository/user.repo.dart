import 'dart:convert';

import 'package:e_commerce/src/dto/login.dto.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/user.model.dart';
import 'package:e_commerce/src/service/api.service.dart';
import 'package:e_commerce/src/service/auth_service.dart';
import 'package:e_commerce/src/utils/exceptions.utils.dart';
import 'package:get/get.dart';

class UsersRepo {
  final ApiService _apiService;

  static const String _login = "Login";

  UsersRepo({required ApiService apiService}) : _apiService = apiService;

  Future<Data<User>> login(LoginDto dto) async {
    try {
      Data<User> user = await _apiService.postRequest<Data<User>>(
          _login, dto.serializer().toJson(), (response) {
        Data<User> user = Data.empty();
        var loginResponse = jsonDecode(response.bodyString!);
        User userInfo =
            User().serilizer().fromJson(loginResponse["value"]["userDetails"]);
        userInfo.deviceToken = loginResponse["value"]["token"];
        user.data = userInfo;
        return user;
      });
      if (user.isSucceed && user.data != null) {
        Get.find<AuthService>().saveUser(user.data!);
        await Get.find<AuthService>().loadUser();
      }
      return user;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-error".tr);
    }
  }
}
