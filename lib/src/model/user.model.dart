import 'model.dart';

class User implements Model {
  int? id;
  String? token;

  User({this.id, this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    token = json["token"];
  }

  @override
  Map<String, dynamic> toJson() {
    return {"id": id, "token": token};
  }
}
