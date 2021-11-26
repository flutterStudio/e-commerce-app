import 'package:e_commerce/src/dto/login.dto.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/user.model.dart';
import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:get/get.dart';

class ProductListcontroller extends GetxController {
  Rx<List<String>>? errors = Rx([]);
  Rx<Data<User>> loginStatus = Rx(Data.empty());

  Future<void> login({required String email, required String password}) async {
    loginStatus.value = Data.inProgress();

    loginStatus.value = await Get.find<MainRepo>()
        .usersRepo
        .login(LoginDto(email: email, password: password));
  }
}
