import 'package:e_commerce/src/model/model.dart';
import 'package:get/get_connect/connect.dart';

class ApiService extends GetConnect {
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjIiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiU2FtaXIiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJVc2VyIiwianRpIjoiNmVmN2NlMDktYTE5OS00OGI2LWFiNzUtMGJhYmMwZDAwZDUzIiwiZXhwIjoxNjM2NTcwMzY5fQ.mzmDAJq4HOKaGUXl63NUzEScmEuNfvprGobmS5-1XPk";
  ApiService() {
    baseUrl = "http://10.0.2.2:5000/api/";
  }

  Future<T?> getRequest<T extends Model>(String url,
      {Map<String, dynamic>? query}) async {
    Response<T> result = await super.get<T>(url,
        query: query, decoder: (response) => Model.fromJson(response) as T);

    return result.body;
  }
}
