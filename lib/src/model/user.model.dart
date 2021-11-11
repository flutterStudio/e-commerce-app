import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';

import 'model.dart';

class User implements Model {
  int? id;
  String? token;

  User({this.id, this.token});

  User.fromJson(Map<String, dynamic> json) {}

  @override
  Map<String, dynamic> toJson() {
    return {"id": id, "token": token};
  }

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
    model.token = json["token"];
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    return {"id": model.id, "token": model.token};
  }
}
