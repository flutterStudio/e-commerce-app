import 'package:e_commerce/src/dto/dto.dart';
import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/model/product.model.dart';

class ScreenItemDTO extends DTO {
  String? imageId, itemType, externalLink;
  List<Product>? productScreenItems;
  int? orderNumber;

  ScreenItemDTO.external(
    this.itemType,
    this.externalLink,
    this.imageId,
    this.orderNumber,
  );

  ScreenItemDTO.internal(
    this.itemType,
    this.productScreenItems,
    this.imageId,
    this.orderNumber,
  );

  @override
  ModelSerializer<ScreenItemDTO> serializer() {
    return _ScreenItemDTOSerializer(this);
  }
}

class _ScreenItemDTOSerializer extends ModelSerializer<ScreenItemDTO> {
  _ScreenItemDTOSerializer(ScreenItemDTO model) : super(model);

  @override
  ScreenItemDTO fromJson(Map<String, dynamic> json) {
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "orderNumber": model.orderNumber,
      "itemType": model.itemType,
      "externalLink": model.externalLink,
      "productScreenItems":
          model.productScreenItems?.map((e) => {"productId": e.id}).toList() ??
              [],
      "imageId": model.imageId
    }..removeWhere((key, value) => value == null);
  }
}
