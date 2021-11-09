import 'package:e_commerce/src/repository/product.repo.dart';
import 'package:e_commerce/src/service/api.service.dart';

class MainRepo {
  final ProductRepo productRepo;
  MainRepo({required ApiService apiService})
      : productRepo = ProductRepo(apiService: apiService);
}
