import 'package:e_commerce/src/dto/dto.dart';
import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';

class AddEvaluationDto extends DTO {
  int? productId;
  String? comment;
  double? rate;
  AddEvaluationDto({this.productId, this.comment, this.rate});
  @override
  ModelSerializer<AddEvaluationDto> serializer() {
    return _AddEvaluationDtoSerializer(this);
  }
}

class _AddEvaluationDtoSerializer extends ModelSerializer<AddEvaluationDto> {
  _AddEvaluationDtoSerializer(model) : super(model);
  @override
  AddEvaluationDto fromJson(Map<String, dynamic> json) {
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "comment": model.comment,
      "productId": model.productId,
      "rate": model.rate
    };
  }
}
