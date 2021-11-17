import 'package:e_commerce/src/utils/exceptions.utils.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

typedef ModelDecoder<T> = T Function(Response);

class ApiService extends GetConnect {
  static const String _token =
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjYiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiY29tYXBueTEiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJDb21wYW55IiwianRpIjoiNDMyYzZhNjEtYjM2ZC00ZWIwLThhMjEtNzA5ZjdjY2EwNzgxIiwiZXhwIjoxNjM3MjExMjg5fQ.h5TEQSWromFb53LqBO14P0E6m0RX0t7ip5h8ca722cE";
  ApiService() {
    baseUrl = "http://10.0.2.2:5000/api/";
  }

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
    throw Exception("error-network".tr);
  }

  Future<T> postRequest<T>(String url, dynamic body, ModelDecoder<T> decoder,
      {Map<String, dynamic>? query}) async {
    Response result = await super.post(
      url,
      body,
      headers: {"Authorization": _token},
      query: query,
    );
    if (result.isOk) {
      return decoder(result);
    }
    _processResponseError(result.statusCode);
    throw Exception("error-network".tr);
  }

  Future<T> deleteRequest<T>(String url, ModelDecoder<T> decoder,
      {Map<String, dynamic>? query}) async {
    Response result = await super.delete(
      url,
    );
    if (result.isOk) {
      return decoder(result);
    }
    _processResponseError(result.statusCode);
    throw Exception("error-network".tr);
  }

  void _processResponseError(int? code) {
    throw NetworkException(
        message: "error-network".tr + ", " + "error-$code".tr);
  }
}
