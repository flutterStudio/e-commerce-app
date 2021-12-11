import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/service/auth_service.dart';
import 'package:e_commerce/src/utils/exceptions.utils.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

typedef ModelDecoder<T> = T Function(Response);

class ApiService extends GetConnect {
  ApiService() {
    baseUrl = "http://94.242.58.41:5002/api/";
  }
  String get _token =>
      "Bearer ${Get.find<AuthService>().currentUser.value?.token}";

  Future<T> getRequest<T>(String url, ModelDecoder<T> decoder,
      {Map<String, dynamic>? query}) async {
    Response result = await super.get(
      url,
      query: query,
      headers: {"Authorization": _token},
    );
    if (result.isOk) {
      return decoder(result);
    }
    _processResponseError(result.statusCode);
    throw Exception("message-network-error".tr);
  }

  Future<T> postRequest<T>(String url, dynamic body, ModelDecoder<T> decoder,
      {Map<String, dynamic>? query,
      dynamic Function(double)? uploadProgress}) async {
    Response result = await super.post(url, body,
        headers: {"Authorization": _token},
        query: query,
        uploadProgress: uploadProgress);
    if (result.isOk) {
      return decoder(result);
    }
    _processResponseError(result.statusCode);
    throw Exception("message-network-error".tr);
  }

  Future<T> putRequest<T>(String url, dynamic body, ModelDecoder<T> decoder,
      {Map<String, dynamic>? query}) async {
    Response result = await super.put(
      url,
      body,
      headers: {"Authorization": _token},
      query: query,
    );
    if (result.isOk) {
      return decoder(result);
    }
    _processResponseError(result.statusCode);
    throw Exception("message-network-error".tr);
  }

  Future<T> deleteRequest<T>(
    String url,
    ModelDecoder<T> decoder, {
    Map<String, dynamic>? query,
  }) async {
    Response result = await super.delete(
      url,
      headers: {"Authorization": _token},
    );
    if (result.isOk) {
      return decoder(result);
    }
    _processResponseError(result.statusCode);
    throw Exception("message-network-error".tr);
  }

  void _processResponseError(int? code) {
    ErrorType errorType = ErrorType.none;
    if (code != null) {
      switch (code) {
        case 401:
          {
            errorType = ErrorType.unauthorized;
            break;
          }
        case 402:
          {
            errorType = ErrorType.paymentRequired;
            break;
          }
        case 403:
          {
            errorType = ErrorType.forbidden;
            break;
          }
        case 404:
          {
            errorType = ErrorType.notFound;
            break;
          }
        case 408:
          {
            errorType = ErrorType.timeout;
            break;
          }
        default:
          errorType = ErrorType.none;
      }
      throw NetworkException(message: "message-$code".tr, errorType: errorType);
    } else {
      throw NetworkException(
          message: "message-network-error".tr, errorType: errorType);
    }
  }
}
