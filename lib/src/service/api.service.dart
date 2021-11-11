import 'package:e_commerce/src/utils/exceptions.utils.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

typedef ModelDecoder<T> = T Function(Response);

class ApiService extends GetConnect {
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjIiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiU2FtaXIiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJVc2VyIiwianRpIjoiNmVmN2NlMDktYTE5OS00OGI2LWFiNzUtMGJhYmMwZDAwZDUzIiwiZXhwIjoxNjM2NTcwMzY5fQ.mzmDAJq4HOKaGUXl63NUzEScmEuNfvprGobmS5-1XPk";
  ApiService() {
    baseUrl = "http://10.0.2.2:5000/api/";
  }

  Future<T?> getRequest<T>(String url, ModelDecoder<T> decoder,
      {Map<String, dynamic>? query}) async {
    Response result = await super.get(
      url,
      query: query,
    );
    if (result.isOk) {
      return decoder(result);
    }
    _processResponseError(result.statusCode!);
  }

  void _processResponseError(int code) {
    throw NetworkException(
        message: "error-network".tr + ", " + "error-$code".tr);
  }
}
