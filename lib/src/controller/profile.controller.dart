import 'package:e_commerce/src/repository/main.repo.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final MainRepo _mainRepo;
  ProfileController() : _mainRepo = Get.find<MainRepo>();

  Future<void> logOut() async {
    _mainRepo.usersRepo.logout();
  }
}
