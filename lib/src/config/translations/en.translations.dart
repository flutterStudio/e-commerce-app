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
  "message-error": "An error occured",
  "message-error-invalid-email": "You enterd an invalid email",
  "message-required-field": "This field is required",
  "message-empty-response": "No data found",
  "message-no-products": "No products found",
  "message-no-product-images": "This products has no images",
  "message-error-loading-image": "Could not load image",
  "message-sending-evaluation": "Sending evaluation",
  "message-evaluation-sent": "Evaluation was Sent",
  "message-error-evaluation-not-sent": "Evaluation was not Sent",
  "error-invalid-email": "Invalid Email",
  "no-selected-items": "Please select some items first",
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
  "search-product": "Search product",
  "continue": "Continue",
  "notifications": "Notifications",
  "logout": "Log Out",
  "profile": "Profile",
  "rate-this-product": "Rate this product",
  "app-ratings": "App ratings",
  "show-all-ratings": "Show all ratings",
  "see-more-details": "See more details",
  "product-details": "Product details",
  "product-description": "Product description",
  "product-colors": "Product colors",
  "available-colors": "Available colors",
  "product-sizes": "Product sizes",
  "available-sizes": "Available sizes",
  "add-to-cart": "Add to cart",
  "product-evaluations": "Product evaluations"
};

Map<String, String> _textFields = {
  "textField-password-label": "Password",
  "textField-password-hint": "Enter your password",
  "textField-evaluation-hint": "Write a comment",
  "textField-email-label": "Email",
  "textField-email-hint": "Enter your email",
};

Map<String, String> _question = {
  "question-delete-cart-product": "Are you sure you want to delete ",
};
