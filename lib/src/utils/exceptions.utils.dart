import 'dart:developer';

class NetworkException implements Exception {
  final String _message;

  /// Describes a network error with a [message] for the user and a [logMessage]
  /// for the developers.
  NetworkException({required String message, String? logMessage})
      : _message = message {
    log(message);
  }

  String get info => "Network Error, $_message";
  String get message => _message;
}

class DatabaseException implements Exception {
  final String _message;

  /// Describes a database error with a [message]for the user and a [logMessage]
  /// for the developers..
  DatabaseException({required String message, String? logMessage})
      : _message = message {
    log(logMessage ?? message);
  }
  String get info => "Database Exception, $_message";
  String get message => _message;
}

class DataFormat implements Exception {
  final String _message;

  /// Describes a formatting error with a [message]for the user and a
  /// [logMessage] for the developers..
  DataFormat({required String message, String? logMessage})
      : _message = message {
    log(logMessage ?? message);
  }
  String get info => "Data Format Exception, $_message";
  String get message => _message;
}
