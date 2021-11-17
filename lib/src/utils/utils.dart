class Utils {
  static T? enumFromString<T>(Iterable<T> values, String value) =>
      values.firstWhere(
        (type) => type.toString().split(".").last == value,
      );
}
