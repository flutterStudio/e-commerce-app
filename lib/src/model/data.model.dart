import 'package:get/get.dart';

class Data<T> {
  T? _data;
  DataStatus _status;
  String? _message;
  int _page = 0;
  int _totalResults = 0;
  int _totalPages = 0;
  bool _hasData = false;
  bool _hasNext = false;
  bool _hasPrevious = false;
  bool get isSucceed => _status == DataStatus.succeed;
  bool get isFaild => _status == DataStatus.faild;

  Data({
    required T data,
    required DataStatus status,
    required String message,
    int page = 0,
    int totalPages = 0,
    int totalResults = 0,
  })  : _data = data,
        _status = status,
        _message = message,
        _page = page,
        _totalResults = totalResults,
        _totalPages = totalPages {
    _hasData = _data != null;
    _hasNext = _page < totalPages;
    _hasPrevious = _page > 1;
  }

  Data.copy(Data t) : _status = t.status {
    _data = t.data;
    _message = t.message;
    _page = t.page;
    _totalPages = t.totalPages;
    _totalResults = t.totalResults;
    _hasData = _data != null;
    _hasNext = _page < totalPages;
    _hasPrevious = _page > 1;
  }

  Data.copyProperties(Data t) : _status = t.status {
    _message = t.message;
    _page = t.page;
    _totalPages = t.totalPages;
    _totalResults = t.totalResults;
    _hasData = _data != null;
    _hasNext = _page < totalPages;
    _hasPrevious = _page > 1;
  }

  Data.faild({
    T? previousData,
    required String message,
  }) : _status = DataStatus.faild {
    _data = previousData;

    _message = message;
  }

  Data.succeed(
      {required T data,
      String? message,
      int page = 0,
      int totalPages = 0,
      int totalResults = 0})
      : _status = DataStatus.succeed {
    _data = data;
    _message = message;
    _page = page;
    _totalPages = totalPages;
    _totalResults = totalResults;
    _hasData = _data != null;
    _hasNext = page < totalPages;
    _hasPrevious = page > 1;
  }

  Data.inProgress({
    String? message,
    T? initialData,
  }) : _status = DataStatus.inProgress {
    _hasData = initialData == null ? false : true;
    _data = initialData;
    _message = message;
  }

  Data.withData({
    required T data,
  }) : _status = DataStatus.inProgress {
    _hasData = data == null ? false : true;
    _data = data;

    _message = message;
  }

  Data.empty({
    T? initialData,
  }) : _status = DataStatus.none {
    _data = initialData;
    _hasData = initialData == null ? false : true;
  }

  void copyProperties(Data t) {
    _status = t.status;
    _message = t.message;
    _page = t.page;
    _totalPages = t.totalPages;
    _totalResults = t.totalResults;
    _hasData = _data != null;
    _hasNext = _page < totalPages;
    _hasPrevious = _page > 1;
  }

  set data(data) {
    _hasData = data == null || GetUtils.isNullOrBlank(data)! ? false : true;
    _data = data;
    _status = _hasData ? DataStatus.succeed : DataStatus.none;
  }

  set status(s) => _status = s;

  set message(message) => _message = message;

  set page(page) {
    _page = page;
    _hasNext = _page < _totalPages;
  }

  set totalPages(totalPages) {
    _totalPages = totalPages;
  }

  set totalResults(totalResults) {
    _totalResults = totalResults;
  }

  T? get data => _data;

  DataStatus get status => _status;
  String? get message => _message;

  int get page => _page;
  int get totalPages => _totalPages;
  int get totalResults => _totalResults;

  bool get hasNext => _hasNext;
  bool get hasPrevious => _hasPrevious;
  bool get hasData => _hasData;
}

enum DataStatus { inProgress, succeed, faild, timeout, none }
