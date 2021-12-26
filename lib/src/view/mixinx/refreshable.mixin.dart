import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

mixin RefreshableMixin on StatelessWidget {
  Widget body(BuildContext context);
  PreferredSizeWidget? headerBuiler(BuildContext context,
          {Widget? title, Widget? leading}) =>
      title == null && leading == null
          ? null
          : AppBar(
              leading: leading ?? const BackButton(),
              title: title,
            );
  Future<void> onRefresh();
  VoidCallback? onloadMore() => null;
  FloatingActionButton? floatingActionButton(BuildContext context) => null;
  RefreshController refreshController() => RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: floatingActionButton(context),
        appBar: headerBuiler(context),
        body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          controller: refreshController(),
          onRefresh: () {
            onRefresh();
          },
          onLoading: () {
            onloadMore();
          },
          child: body(context),
        ));
  }
}
