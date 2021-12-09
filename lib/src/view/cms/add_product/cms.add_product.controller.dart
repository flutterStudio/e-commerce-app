import 'package:e_commerce/src/model/color.model.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/model/size.model.dart';
import 'package:get/get.dart';

class CMSAddProductController extends GetxController {
  Rx<List<String>>? errors = Rx([]);
  Rx<Data<Product>> loginStatus = Rx(Data.empty());

  Rx<String?> title = Rx(null);
  Rx<String?> description = Rx(null);
  Rx<int?> minQuantity = Rx(null);
  Rx<int?> availableQuntity = Rx(null);
  Rx<double?> price = Rx(null);

  Rx<List<ColorModel>>? colors = Rx([]);
  Rx<List<Size>>? sizes = Rx([]);
}
