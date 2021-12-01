import 'package:e_commerce/src/dto/dto.dart';
import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';

class AddToCartDTO extends DTO {
  int? productId;
  int? productColorId;
  int? productSizeId;
  int? quantity;
  AddToCartDTO(
      {this.productId, this.quantity, this.productColorId, this.productSizeId});
  @override
  ModelSerializer<AddToCartDTO> serializer() {
    return _AddToCartDTOSerializer(this);
  }
}

class _AddToCartDTOSerializer extends ModelSerializer<AddToCartDTO> {
  _AddToCartDTOSerializer(model) : super(model);
  @override
  AddToCartDTO fromJson(Map<String, dynamic> json) {
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "productId": model.productId,
      "productColorId": model.productColorId,
      "productSizeId": model.productSizeId,
      "quantity": model.quantity
    };
  }
}
