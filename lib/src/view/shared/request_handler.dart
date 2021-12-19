import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/view/shared/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/src/utils/extensions.dart';

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
class RequestHandler<T> extends StatelessWidget {
  final Data<T> _data;
  final OnSucess<T> _onSuccess;
  final Widget Function(String? error)? _onFailed;
  final Widget? _inProgress;
  final Widget? _other;
  final Widget? _onEmpty;
  final VoidCallback? onErrorRetry;

  const RequestHandler(
      {Key? key,
      required OnSucess<T> onSuccess,
      Widget Function(String? error)? onFailed,
      inProgress,
      Widget? onEmpty,
      other,
      required Data<T> data,
      this.onErrorRetry})
      : _onSuccess = onSuccess,
        _onFailed = onFailed,
        _inProgress = inProgress,
        _other = other,
        _data = data,
        _onEmpty = onEmpty,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _contentBuilder(context),
    );
  }

  Widget _contentBuilder(BuildContext context) {
    switch (_data.status) {
      case DataStatus.inProgress:
        {
          return _inProgress ?? const CircularProgressIndicator();
        }
      case DataStatus.faild:
        {
          return _onFailed != null
              ? _onFailed!(_data.message)
              : _errorWidget(
                  _data.message ?? "message-error".tr,
                );
        }
      case DataStatus.succeed:
        {
          if (_data.data.isNullOrEmpty()) {
            return _onEmpty ??
                _emptyResponseWidget("message-empty-response".tr);
          } else {
            return _onSuccess(context, _data.data!);
          }
        }
      case DataStatus.empty:
        {
          return _onEmpty ?? _emptyResponseWidget("message-empty-response".tr);
        }
      case DataStatus.none:
        {
          return Container();
        }
      default:
        {
          return _other ?? Container();
        }
    }
  }

  Widget _errorWidget(String message) {
    return Column(
      children: [
        const Spacer(),
        Expanded(
          child: Column(
            children: [
              Icon(Icons.error_outline, color: Get.theme.colorScheme.primary),
              const SizedBox(
                height: SizeConfig.verticalSpace,
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Get.textTheme.headline5
                    ?.copyWith(color: Get.theme.colorScheme.primary),
              ),
              onErrorRetry == null
                  ? Container()
                  : DefaultButton(
                      child: Text("retry".tr),
                      press: onErrorRetry,
                    )
            ],
          ),
        ),
      ],
    );
  }

  Widget _emptyResponseWidget(String message) {
    return Column(
      children: [
        Icon(Icons.error_outline, color: Get.theme.colorScheme.primary),
        const SizedBox(
          height: SizeConfig.verticalSpace,
        ),
        Text(
          message,
          style: Get.textTheme.headline5
              ?.copyWith(color: Get.theme.colorScheme.primary),
        )
      ],
    );
  }
}
