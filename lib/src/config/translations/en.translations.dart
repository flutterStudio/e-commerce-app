part of "translations.dart";

Map<String, String> _english = {
  "appTitle": "Flutter Template",
  "en": "English",
  "ar": "Arabic",
  ..._errors,
  ..._messages,
  ..._text,
  ..._question,
  ..._textFields
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
  "login": "Login",
  "login-with-email-password": "Login with your email and password",
  "welcome-back": "Welcome Back",
  "remember-me": "Remember me",
  "forgot-password": "Forgot password",
  "ok": "Ok",
  "cancel": "Cancel",
  "continue": "Continue",
};

Map<String, String> _textFields = {
  "textField-password-label": "Password",
  "textField-password-hint": "Enter your password",
  "textField-email-label": "Email",
  "textField-email-hint": "Enter your email",
};

Map<String, String> _question = {
  "question-delete-cart-product": "Are you sure you want to delete ",
};
