abstract class ModelSerializer<T> {
  T model;
  ModelSerializer(this.model);
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
