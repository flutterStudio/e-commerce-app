part of "translations.dart";

Map<String, String> _english = {
  "appTitle": "Flutter Template",
  "en": "English",
  "ar": "Arabic",
}
  ..addAll(_errors)
  ..addAll(_messages);

Map<String, String> _errors = {
  "error-network": "Network error",
  "error-400": "Bad Request",
  "error-401": "Unauthorized",
  "error-403": "Forbidden",
  "error-404": "Not Found",
  "error-408": "Request Timeout",
  "error-409": "Operation Denied",
  "error-500": "Server Error",
};

Map<String, String> _messages = {
  "message-error": "An Error occured",
  "message-empty-response": "No data found",
  "message-no-products": "No products found",
  "message-error-loading-image": "Could not load image",
};
