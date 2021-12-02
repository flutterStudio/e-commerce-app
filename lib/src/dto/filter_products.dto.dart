import 'package:e_commerce/src/dto/dto.dart';
import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/model/category.model.dart';

class FilterProductsDto extends DTO {
  List<Category>? categories;
  FilterProductsDto({this.categories});
  @override
  ModelSerializer<FilterProductsDto> serializer() {
    return _FilterProductsDtoSerializer(this);
  }
}

class _FilterProductsDtoSerializer extends ModelSerializer<FilterProductsDto> {
  _FilterProductsDtoSerializer(model) : super(model);
  @override
  FilterProductsDto fromJson(Map<String, dynamic> json) {
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "categories": model.categories?.map((e) => e.title).toList() ?? [],
    };
  }
}
