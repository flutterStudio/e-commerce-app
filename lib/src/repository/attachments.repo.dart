import 'dart:convert';
import 'dart:io';

import 'package:e_commerce/src/model/attachment.model.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/service/api.service.dart';
import 'package:e_commerce/src/utils/exceptions.utils.dart';
import 'package:e_commerce/src/utils/file.utils.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:get/get.dart';

class AttachmentsRepo {
  final ApiService _apiService;

  static const String _upload = "Attachment/upload";

  AttachmentsRepo({required ApiService apiService}) : _apiService = apiService;

  Future<Data<Attachment>> uplaod(File file) async {
    try {
      FormData fromData = FormData({
        'file': MultipartFile(file,
            filename: FileUtils.getFileName(file) ?? "file.type")
      });
      Data<Attachment>? data = await _apiService
          .postRequest<Data<Attachment>>(_upload, fromData, (response) {
        Data<Attachment> data = Data.empty();

        Attachment attachment =
            Attachment().serilizer().fromJson(jsonDecode(response.bodyString!));
        data = Data.succeed(data: attachment);
        return data;
      }, uploadProgress: (value) {});

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-unknown-error".tr);
    }
  }
}
