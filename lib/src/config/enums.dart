// ignore_for_file: constant_identifier_names
enum ScreenItemtype {
  Product,
  ProductGroup,
  Image,
  ImageGroup,
  Banner,
  Slider,
  Item
}
enum ScreenItemActionType { External, Internal }

enum MediaType { image, video, audio, none, any }
enum UserRole { User, Company }

enum ErrorType {
  forbidden,
  notFound,
  unauthorized,
  badRequest,
  timeout,
  internalError,
  paymentRequired,
  none
}
