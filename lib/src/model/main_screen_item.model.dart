import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/model/model.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/utils/utils.dart';

class ScreenItem extends Model {
  int? screenItemId;
  int? orderNumber;
  String? image;
  ScreenItemtype? itemType;
  ScreenItemActionType? actionType;
  String? externalLink;
  List<Product>? productScreenItems;

  @override
  ModelSerializer<ScreenItem> serilizer() {
    return _ScreenItemModelSerializer(this);
  }
}

class _ScreenItemModelSerializer extends ModelSerializer<ScreenItem> {
  _ScreenItemModelSerializer(ScreenItem model) : super(model);

  @override
  ScreenItem fromJson(Map<String, dynamic> json) {
    model.screenItemId = json["screenItemId"];
    model.image = json["image"]["downloadUrl"];
    model.externalLink = json["externalLink"];
    model.orderNumber = json["orderNumber"];
    model.productScreenItems = json["productScreenItems"];

    try {
      model.actionType = Utils.enumFromString<ScreenItemActionType>(
          ScreenItemActionType.values, json["actionType"]);

      if (model.actionType == ScreenItemActionType.Internal) {
        _initInternalContents(json);
      }
    } catch (e) {
      model.actionType = null;
    }

    try {
      model.itemType = Utils.enumFromString<ScreenItemtype>(
          ScreenItemtype.values, json["itemType"]);
    } catch (e) {
      model.itemType = null;
    }

    return model;
  }

  List<Product> _initInternalContents(Map<String, dynamic> json) {
    var productsJson = json["productScreenItems"];
    List<Product> products = [];
    if (productsJson == null) return [];

    for (var product in productsJson) {
      products.add(Product().serilizer().fromJson(product["product"]));
    }
    return products;
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
