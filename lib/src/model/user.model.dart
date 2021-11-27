import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';

import 'model.dart';

class User implements Model {
  int? id;
  String? deviceToken;
  String? firstName;
  String? email;
  String? lastName;
  String? password;

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
    model.id = json["id"];
    model.deviceToken = json["deviceToken"];
    model.firstName = json["firstName"];
    model.lastName = json["lastName"];
    model.email = json["email"];
    model.password = json["password"];
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": model.id,
      "deviceToken": model.deviceToken,
      "lastName": model.lastName,
      "firstName": model.firstName,
      "password": model.password,
      "email": model.email
    };
  }
}
