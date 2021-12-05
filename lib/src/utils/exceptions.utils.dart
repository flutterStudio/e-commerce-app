import 'dart:developer';

import 'package:e_commerce/src/config/enums.dart';

abstract class BaseException implements Exception {
  BaseException({this.errorType = ErrorType.none});
  final ErrorType? errorType;
}

class NetworkException extends BaseException {
  final String _message;

  /// Describes a network error with a [message] for the user and a [logMessage]
  /// for the developers.
  NetworkException(
      {required String message, String? logMessage, ErrorType? errorType})
      : _message = message,
        super(errorType: errorType) {
    log(message);
  }

  String get info => "Network Error, $_message";
  String get message => _message;
}

class DatabaseException extends BaseException {
  final String _message;

  /// Describes a database error with a [message]for the user and a [logMessage]
  /// for the developers..
  DatabaseException(
      {required String message, String? logMessage, ErrorType? errorType})
      : _message = message,
        super(errorType: errorType) {
    log(logMessage ?? message);
  }
  String get info => "Database Exception, $_message";
  String get message => _message;
}

class DataFormat extends BaseException {
  final String _message;

  /// Describes a formatting error with a [message]for the user and a
  /// [logMessage] for the developers..
  DataFormat(
      {required String message, String? logMessage, ErrorType? errorType})
      : _message = message,
        super(errorType: errorType) {
    log(logMessage ?? message);
  }
  String get info => "Data Format Exception, $_message";
  String get message => _message;
}
