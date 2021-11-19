part of "translations.dart";

Map<String, String> _english = {
  "appTitle": "Flutter Template",
  "en": "English",
  "ar": "Arabic",
  ..._errors,
  ..._messages,
  ..._text,
  ..._question
};

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
  "message-no-product-images": "This products has no images",
  "message-error-loading-image": "Could not load image",
};

Map<String, String> _text = {
  "min-amount": "Minimum amount",
  "available-amount": "Available amount",
  "total-price": "Total price",
  "ok": "Ok",
  "cancel": "Cancel",
  "search-product": "Search product",
};

Map<String, String> _question = {
  "question-delete-cart-product": "Are you sure you want to delete ",
};
