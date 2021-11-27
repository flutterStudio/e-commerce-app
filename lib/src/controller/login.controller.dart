import 'package:e_commerce/src/dto/login.dto.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/user.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<List<String>>? errors = Rx([]);
  Rx<Data<User>> loginStatus = Rx(Data.empty());

  Rx<String?> email = Rx(null);
  Rx<String?> password = Rx(null);
  Rx<bool> remember = Rx(false);

  Future<void> login() async {
    loginStatus.value = Data.inProgress();

    loginStatus.value = await Get.find<MainRepo>()
        .usersRepo
        .login(LoginDto(email: email.value, password: password.value));
  }
}
