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
  static const String _story = "Story/";

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

  ///
  /// #### brief
  /// Post a new story using the given [attachmentId].
  ///
  /// #### return
  /// `Data<Story>` : a Data instance that contains the added story if the
  /// result was `ok`, or an empty list if the request fails.
  Future<Data<Story>> postStory(String attachmentId) async {
    try {
      Data<Story> data = await _apiService.postRequest<Data<Story>>(
          _story, {"attachmentId": attachmentId}, (response) {
        var jsonStory = jsonDecode(response.bodyString!);
        Story story = Story().serilizer().fromJson(jsonStory);
        return Data.succeed(
            data: story,
            showSnackbar: true,
            message:
                "item-posted-successfully".trParams({"item": attachmentId}));
      });

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message, showSnackbar: true);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-error".tr);
    }
  }

  ///
  /// #### brief
  /// Delete the story with the given [id].
  ///
  /// #### return
  /// `Data<Story>` : a Data instance that contains the added story if the
  /// result was `ok`, or an empty list if the request fails.
  Future<Data<bool>> deleteStory(String id) async {
    try {
      Data<bool> data =
          await _apiService.deleteRequest<Data<bool>>(_story + id, (response) {
        return Data.succeed(
            data: true,
            showSnackbar: true,
            message:
                "item-deleted-successfully".trParams({"item": "Story $id"}));
      });

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message, showSnackbar: true);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-error".tr);
    }
  }

  ///
  /// #### brief
  /// Post a  collection of stories using a list given [attachments] ids.
  ///
  /// #### return
  /// `List<Data<Story>>` : a Data instance that contains the added story if the
  /// result was `ok`, or an empty list if the request fails.
  Future<Data<List<Data<Story>>>> postStories(List<String> attachments) async {
    List<Data<Story>> result = [];
    for (var attachment in attachments) {
      result.add(await postStory(attachment));
    }
    if (result.any((element) => element.isFaild)) {
      return Data.faild(
          message: "faild-to-post-all-stories", showSnackbar: true);
    }
    return Data.succeed(
        data: result,
        message: "item-posted-successfully".trParams({"item": "Story"}),
        showSnackbar: true);
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
