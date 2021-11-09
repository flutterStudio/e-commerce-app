class CustomException implements Exception {
  final String message;

  CustomException(this.message);
}

class IOException implements Exception {
  final String message;

  IOException(this.message);
}
