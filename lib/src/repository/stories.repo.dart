import 'dart:convert';

import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/story.model.dart';
import 'package:e_commerce/src/service/api.service.dart';
import 'package:e_commerce/src/utils/exceptions.utils.dart';
import 'package:get/get.dart';

class StoriesRepo {
  final ApiService _apiService;
  static const String _allMarketsStories = "Story/groupedByUser";
  static const String _marketStories = "Story/userStories";

  StoriesRepo({required ApiService apiService}) : _apiService = apiService;

  ///
  /// #### brief
  /// Fetch the first story for each company user (market).
  ///
  /// #### return
  /// `Data<List<Story>>` : a Data instance that contains the list of stories if the
  /// result was `ok`, or an empty list if the request fails.
  Future<Data<List<Story>>> getAllMarketsStories() async {
    try {
      Data<List<Story>> data = await _apiService
          .getRequest<Data<List<Story>>>(_allMarketsStories, (response) {
        Data<List<Story>> data = Data.empty();
        List<Story> stories = [];

        var storiesJson = jsonDecode(response.bodyString!) as List;
        stories = _initStoriesData(storiesJson);
        if (stories.isNotEmpty) {
          return Data.succeed(data: stories);
        }
        return data;
      });

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-error".tr);
    }
  }

  ///
  /// #### brief
  /// Fetch all stories for the company's user(market) specified by the
  /// given [companyId].
  ///
  /// #### return
  /// `Data<List<Story>>` : a Data instance that contains the list of stories if the
  /// result was `ok`, or an empty list if the request fails.
  Future<Data<List<Story>>> getCompanyStories(int companyId) async {
    try {
      Data<List<Story>> data = await _apiService.getRequest<Data<List<Story>>>(
          _marketStories + "/$companyId", (response) {
        Data<List<Story>> data = Data.empty();
        List<Story> stories = [];

        var storiesJson = jsonDecode(response.bodyString!) as List;
        stories = _initStoriesData(storiesJson);
        if (stories.isNotEmpty) {
          return Data.succeed(data: stories);
        }
        return data;
      });

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-error".tr);
    }
  }

  List<Story> _initStoriesData(List<dynamic> jsonList) {
    List<Story> stories = [];

    for (var item in jsonList) {
      Story story = Story().serilizer().fromJson(item);
      stories.add(story);
    }
    return stories;
  }
}
