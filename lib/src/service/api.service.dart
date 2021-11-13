import 'package:e_commerce/src/utils/exceptions.utils.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

typedef ModelDecoder<T> = T Function(Response);

class ApiService extends GetConnect {
  ApiService() {
    baseUrl = "http://10.0.2.2:5000/api/";
  }

  Future<T> getRequest<T>(String url, ModelDecoder<T> decoder,
      {Map<String, dynamic>? query}) async {
    Response result = await super.get(
      url,
      query: query,
    );
    if (result.isOk) {
      return decoder(result);
    }
    _processResponseError(result.statusCode!);
    throw Exception("error-network".tr);
  }

  Future<T> postRequest<T>(String url, dynamic body, ModelDecoder<T> decoder,
      {Map<String, dynamic>? query}) async {
    Response result = await super.post(
      url,
      body,
      query: query,
    );
    if (result.isOk) {
      return decoder(result);
    }
    _processResponseError(result.statusCode!);
    throw Exception("error-network".tr);
  }

  void _processResponseError(int code) {
    throw NetworkException(
        message: "error-network".tr + ", " + "error-$code".tr);
  }
}
