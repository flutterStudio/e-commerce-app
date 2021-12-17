import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/utils/utils.dart';

import 'model.dart';

class User implements Model {
  int? id;
  String? deviceToken;
  String? firstName;
  String? email;
  String? lastName;
  String? password;
  UserRole? userRole;
  String? token;

  User({this.id, this.deviceToken});
  User.create(
      {required this.deviceToken,
      required this.password,
      required this.email,
      required this.firstName,
      required this.lastName});
  @override
  ModelSerializer<User> serilizer() {
    return _UserSerializer(this);
  }
}

class _UserSerializer extends ModelSerializer<User> {
  _UserSerializer(User model) : super(model);

  @override
  User fromJson(Map<String, dynamic> json) {
    model.id = json["userId"];
    model.deviceToken = json["deviceToken"];
    model.token = json["token"];
    model.firstName = json["firstName"];
    model.lastName = json["lastName"];
    try {
      model.userRole =
          Utils.enumFromString<UserRole>(UserRole.values, json["userRole"]);
    } catch (e) {
      model.userRole = null;
    }
    model.email = json["email"];
    model.password = json["password"];
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "userId": model.id,
      "deviceToken": model.deviceToken,
      "token": model.token,
      "lastName": model.lastName,
      "userRole": model.userRole.toString().split(".").last,
      "firstName": model.firstName,
      "password": model.password,
      "email": model.email
    };
  }
}
