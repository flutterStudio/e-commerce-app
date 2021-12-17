import 'dart:convert';
import 'package:e_commerce/src/dto/screen%20_item.dto.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/main_screen_item.model.dart';
import 'package:e_commerce/src/service/api.service.dart';
import 'package:e_commerce/src/utils/exceptions.utils.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get.dart';

class OfferRepo {
  final ApiService _apiService;

  static const String _allScreenItems = "ScreenItem/all/";
  static const String _screenItem = "ScreenItem/";
  static const String _externalScreenItem = _screenItem + "External/";
  static const String _internalScreenItem = _screenItem + "Internal/";

  OfferRepo({required ApiService apiService}) : _apiService = apiService;

  Future<Data<List<ScreenItem>>> getAllScreenItems(
      {int? page, int? pageSize}) async {
    Data<List<ScreenItem>> data = await _getScreenItems(_allScreenItems);
    return data;
  }

  Future<Data<ScreenItem>> postSCreenItem(ScreenItemDTO dto,
      {int? page, int? pageSize, bool isExternal = false}) async {
    try {
      Data<ScreenItem> data = await _apiService.postRequest(
          isExternal ? _externalScreenItem : _internalScreenItem,
          dto.serializer().toJson(), (response) {
        Data<ScreenItem> data = Data.empty();

        // Get pagination info if exists.
        data = Data.succeed(
            showSnackbar: true,
            message: "item-uploaded-successfully".trParams({"item": "Offer"}),
            data: ScreenItem()
                .serilizer()
                .fromJson(jsonDecode(response.bodyString!)));
        return data;
      });
      return data;
    } on NetworkException catch (e) {
      return Data.faild(
        message: e.message,
        showSnackbar: true,
      );
    } on FormatException catch (e) {
      return Data.faild(
        message: e.message,
        showSnackbar: true,
      );
    } catch (e) {
      return Data.faild(
        message: e.toString(),
        showSnackbar: true,
      );
    }
  }

  Future<Data<bool>> deleteScreenItem(int id,
      {int? page, int? pageSize, bool isExternal = false}) async {
    try {
      Data<bool> data = await _apiService
          .deleteRequest(_screenItem + id.toString(), (response) {
        // Get pagination info if exists.
        return Data.succeed(
            showSnackbar: true,
            message:
                "item-deleted-successfully".trParams({"item": "Offer $id"}),
            data: true);
      });
      return data;
    } on NetworkException catch (e) {
      return Data.faild(
        message: e.message,
        showSnackbar: true,
      );
    } on FormatException catch (e) {
      return Data.faild(
        message: e.message,
        showSnackbar: true,
      );
    } catch (e) {
      return Data.faild(
        message: e.toString(),
        showSnackbar: true,
      );
    }
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
    } catch (e) {
      return Data.faild(message: e.toString());
    }
  }

  Future<Data<ScreenItem>> getScreenItem(int id,
      {int? page, int? pageSize}) async {
    try {
      Data<ScreenItem>? data = await _apiService.getRequest<Data<ScreenItem>>(
          _screenItem + id.toString(), (response) {
        Data<ScreenItem> data = Data.empty();

        // Get pagination info if exists.
        data.data =
            ScreenItem().serilizer().fromJson(jsonDecode(response.bodyString!));
        return data;
      },
          query: {"page": page, "pageSize": pageSize}
            ..removeWhere((key, value) => value == null));

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: e.toString());
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
