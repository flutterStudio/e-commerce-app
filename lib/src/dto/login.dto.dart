import 'package:e_commerce/src/dto/dto.dart';
import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';

class LoginDto extends DTO {
  String? email;
  String? password;
  String? deviceToken;
  LoginDto({this.email, this.password, this.deviceToken = "TOKEN"});
  @override
  ModelSerializer<LoginDto> serializer() {
    return _LoginDtoSerializer(this);
  }
}

class _LoginDtoSerializer extends ModelSerializer<LoginDto> {
  _LoginDtoSerializer(model) : super(model);
  @override
  LoginDto fromJson(Map<String, dynamic> json) {
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "password": model.password,
      "email": model.email,
      "deviceToken": model.deviceToken
    };
  }
}
