import 'dart:developer';
import 'dart:io';

import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/service/auth_service.dart';
import 'package:e_commerce/src/view/shared/action.dialog.dart';
import 'package:get/get.dart';

abstract class BaseException implements Exception {
  BaseException({this.errorType = ErrorType.none, required this.message}) {
    handleEception();
  }
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
          Get.dialog(
              ActionDialog(
                title: 'message-401'.tr + '\n ' + 'question-login'.tr,
                onApprove: () {
                  Get.find<AuthService>().removeUser();
                },
                onDeny: () {
                  exit(exitCode);
                },
              ),
              barrierDismissible: false);
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
    // log(message);
  }

  String get info => "Network Error, $message";
}

class DatabaseException extends BaseException {
  /// Describes a database error with a [message]for the user and a [logMessage]
  /// for the developers..
  DatabaseException(
      {required String message, String? logMessage, ErrorType? errorType})
      : super(errorType: errorType, message: message) {
    log(logMessage ?? message);
  }

  String get info => "Database Error, $message";
}

class DataFormatException extends BaseException {
  /// Describes a formatting error with a [message]for the user and a
  /// [logMessage] for the developers..
  DataFormatException(
      {required String message, String? logMessage, ErrorType? errorType})
      : super(errorType: errorType, message: message) {
    log(logMessage ?? message);
  }

  String get info => "DataFormat Error, $message";
}
