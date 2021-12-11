import 'package:e_commerce/src/repository/attachments.repo.dart';
import 'package:e_commerce/src/repository/offer.repo.dart';
import 'package:e_commerce/src/repository/product.repo.dart';
import 'package:e_commerce/src/repository/stories.repo.dart';
import 'package:e_commerce/src/repository/user.repo.dart';
import 'package:e_commerce/src/service/api.service.dart';

class MainRepo {
  final ProductRepo productRepo;
  final OfferRepo offerRepo;
  final StoriesRepo storiesRepo;
  final UsersRepo usersRepo;
  final AttachmentsRepo attachmentsRepo;

  MainRepo({required ApiService apiService})
      : productRepo = ProductRepo(apiService: apiService),
        usersRepo = UsersRepo(apiService: apiService),
        offerRepo = OfferRepo(apiService: apiService),
        attachmentsRepo = AttachmentsRepo(apiService: apiService),
        storiesRepo = StoriesRepo(apiService: apiService);
}
