import 'package:e_commerce/src/dto/dto.dart';
import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/model/attachment.model.dart';
import 'package:e_commerce/src/model/category.model.dart';
import 'package:e_commerce/src/model/color.model.dart';
import 'package:e_commerce/src/model/size.model.dart';

class UpdateProductDto extends DTO {
  String? title, description;
  List<Attachment>? images;
  List<ColorModel>? colors;
  List<Category>? categories;
  double? price, discount;
  int? minQuantity, availableQuantity, id;
  List<Size>? sizes;
  UpdateProductDto(
      {this.images,
      this.colors,
      this.sizes,
      this.description,
      this.discount,
      this.title,
      this.id,
      this.price,
      this.minQuantity,
      this.availableQuantity});

  @override
  ModelSerializer<UpdateProductDto> serializer() {
    return _UpdateProductDtoSerializer(this);
  }
}

class _UpdateProductDtoSerializer extends ModelSerializer<UpdateProductDto> {
  _UpdateProductDtoSerializer(UpdateProductDto model) : super(model);

  @override
  UpdateProductDto fromJson(Map<String, dynamic> json) {
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "productId": model.id,
      "minQuantity": model.minQuantity,
      "availableQuantity": model.availableQuantity,
      "price": model.price,
      "discount": model.discount,
      "description": model.description,
      "productCategories":
          model.categories?.map((e) => {"categoryId": e.id}).toList() ??
              [
                {"categoryId": 1}
              ],
      "mainImageId": model.images == null
          ? null
          : model.images!.isNotEmpty
              ? model.images![0].attachmentId
              : null,
      "productImagesList": model.images == null
          ? null
          : model.images!.length <= 1
              ? []
              : model.images
                  ?.map((e) => {"attachmentId": e.attachmentId})
                  .toList()
                  .removeAt(0),
      "productSizes": model.sizes?.map((e) => {"sizeId": e.id}).toList(),
      "productColors": model.colors?.map((e) => {"colorId": e.id}).toList(),
      "title": model.title
    }..removeWhere((key, value) => value == null);
  }
}
