extension ObjectExtension on Object? {
  bool isNullOrEmpty() => this == null
      ? true
      : this is String
          ? this == "" || (this as String).isEmpty
          : this is Iterable
              ? (this as Iterable).isEmpty
              : this is Map
                  ? (this as Map).isEmpty
                  : false;
}
