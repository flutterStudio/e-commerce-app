import 'package:e_commerce/src/model/data.model.dart';
import 'package:flutter/material.dart';

typedef OnSucess<T> = Widget Function(BuildContext, T data);

/// [RequestHandler] show widgets due to the [Data] object status.
/// [stream]] accepts [Stream] of [Future<Data>], [stream] is required.
/// [mainContent] is the main widget that you want to handle requests from.
/// [onSuccess] is the main widget when [Data] status is succeed, [onSuccess] is required.
/// [onFailed] is thw widget that appears when [Data] status is failed, [onFailed] has a default widget.
/// [inProgress] is the widget that appears when the [Data] status is in-progress, [inProgress] has a default value.
/// [isDismissible] is a boolean variable that indicates if you want user to
/// dismiss messages that shows upon the [mainContent] or not.
/// [other] is the widget that appears when the [Data] status is not one of the previous statuses, [other] has a default value.
class RequestHandler<T> extends StatefulWidget {
  final Data<T> _data;
  final OnSucess<T> _onSuccess;
  final Widget? _onFailed;
  final Widget? _inProgress;
  final Widget? _other;

  const RequestHandler(
      {Key? key,
      required OnSucess<T> onSuccess,
      Widget? onFailed,
      inProgress,
      other,
      required Data<T> data})
      : _onSuccess = onSuccess,
        _onFailed = onFailed,
        _inProgress = inProgress,
        _other = other,
        _data = data,
        super(key: key);

  @override
  _RequestHandlerState<T> createState() => _RequestHandlerState<T>();
}

class _RequestHandlerState<T> extends State<RequestHandler<T>> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget._data.status) {
      case DataStatus.inProgress:
        {
          return widget._inProgress ?? const CircularProgressIndicator();
        }
      case DataStatus.faild:
        {
          return widget._onFailed ?? Text("${widget._data.message}");
        }
      case DataStatus.succeed:
        {
          return widget._onSuccess(context, widget._data.data!);
        }
      default:
        {
          return widget._other ?? Container();
        }
    }
  }
}