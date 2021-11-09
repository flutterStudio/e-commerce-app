import 'package:e_commerce/src/model/model.dart';
import 'package:get/get_connect/connect.dart';

class ApiService extends GetConnect {
  @override
  void onInit() {
    baseUrl = "http://127.0.0.1:5000/api/";
    super.onInit();
  }

  Future<T?> getRequest<T extends Model>(String url,
      {Map<String, dynamic>? query}) async {
    Response<T> result = await super.get<T>(url,
        query: query, decoder: (response) => Model.fromJson(response) as T);

    return result.body;
  }
}
