import 'dart:developer';

import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/service/auth_service.dart';
import 'package:e_commerce/src/view/shared/action.dialog.dart';
import 'package:get/get.dart';

abstract class BaseException implements Exception {
  BaseException({this.errorType = ErrorType.none, required this.message});
  final ErrorType? errorType;
  String message;

  void handleEception() {
    switch (errorType) {
      case ErrorType.forbidden:
        {
          message = "error-403".tr;
          break;
        }
      case ErrorType.unauthorized:
        {
          Get.dialog(ActionDialog(
            title: "error-401".tr,
            onApprove: () {
              Get.find<AuthService>().removeUser();
            },
            onDeny: () {},
          ));
          break;
        }
      default:
    }
  }
}

class NetworkException extends BaseException {
  /// Describes a network error with a [message] for the user and a [logMessage]
  /// for the developers.
  NetworkException(
      {required String message, String? logMessage, ErrorType? errorType})
      : super(errorType: errorType, message: message) {
    log(message);
  }

  @override
  String get message => "Network Error, $message";
}

class DatabaseException extends BaseException {
  /// Describes a database error with a [message]for the user and a [logMessage]
  /// for the developers..
  DatabaseException(
      {required String message, String? logMessage, ErrorType? errorType})
      : super(errorType: errorType, message: message) {
    log(logMessage ?? message);
  }

  @override
  String get message => "Database Error, $message";
}

class DataFormatException extends BaseException {
  /// Describes a formatting error with a [message]for the user and a
  /// [logMessage] for the developers..
  DataFormatException(
      {required String message, String? logMessage, ErrorType? errorType})
      : super(errorType: errorType, message: message) {
    log(logMessage ?? message);
  }

  @override
  String get message => "DataFormat Error, $message";
}
