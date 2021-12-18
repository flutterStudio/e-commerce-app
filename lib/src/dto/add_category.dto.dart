import 'package:e_commerce/src/dto/dto.dart';
import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';

class AddCategoryDTO extends DTO {
  int? id;
  String? title;
  int? superCategoryId;

  AddCategoryDTO({this.superCategoryId, this.title});

  @override
  ModelSerializer serializer() {
    return _AddCategoryDtoSerializer(this);
  }
}

class _AddCategoryDtoSerializer extends ModelSerializer<AddCategoryDTO> {
  _AddCategoryDtoSerializer(AddCategoryDTO model) : super(model);

  @override
  AddCategoryDTO fromJson(Map<String, dynamic> json) {
    model.id = json["categoryId"];
    model.title = json["title"];
    return model;
  }

  @override
  Map<String, dynamic> toJson() => {
        "title": model.title,
        "superCategoryId": model.superCategoryId,
      }..removeWhere((key, value) => value == null);
}
