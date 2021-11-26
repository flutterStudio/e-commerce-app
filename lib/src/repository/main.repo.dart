import 'package:e_commerce/src/repository/product.repo.dart';
import 'package:e_commerce/src/repository/user.repo.dart';
import 'package:e_commerce/src/service/api.service.dart';

class MainRepo {
  final ProductRepo productRepo;
  final UsersRepo usersRepo;
  MainRepo({required ApiService apiService})
      : productRepo = ProductRepo(apiService: apiService),
        usersRepo = UsersRepo(apiService: apiService);
}
