import 'dart:convert';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/main_screen_item.model.dart';
import 'package:e_commerce/src/service/api.service.dart';
import 'package:e_commerce/src/utils/exceptions.utils.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get.dart';

class OfferRepo {
  final ApiService _apiService;

  static const String _allScreenItems = "ScreenItem/all";

  OfferRepo({required ApiService apiService}) : _apiService = apiService;

  Future<Data<List<ScreenItem>>> getAllScreenItems(
      {int? page, int? pageSize}) async {
    Data<List<ScreenItem>> data = await _getScreenItems(_allScreenItems);
    return data;
  }

  Future<Data<List<ScreenItem>>> _getScreenItems(String url,
      {int? page, int? pageSize}) async {
    try {
      Data<List<ScreenItem>>? data = await _apiService
          .getRequest<Data<List<ScreenItem>>>(url, (response) {
        Data<List<ScreenItem>> data = Data.empty();

        // Get pagination info if exists.
        data.data = _initItemsData(response);
        return data;
      },
              query: {"page": page, "pageSize": pageSize}
                ..removeWhere((key, value) => value == null));

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    }
  }

  /// Initalize products response.
  List<ScreenItem> _initItemsData(Response response) {
    List<ScreenItem> items = [];
    var itemsData = jsonDecode(response.bodyString!) as List;
    for (var item in itemsData) {
      items.add(ScreenItem().serilizer().fromJson(item));
    }
    return items;
  }
}
