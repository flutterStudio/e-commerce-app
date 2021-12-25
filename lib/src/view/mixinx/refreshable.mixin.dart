import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

mixin RefreshableMixin on StatelessWidget {
  Widget body(BuildContext context);
  Widget? headerBuiler(BuildContext context,
          {Widget? title, Widget? leading}) =>
      title == null && leading == null
          ? null
          : SliverAppBar(
              leading: leading ?? const BackButton(),
              title: title,
            );
  Future<void> onRefresh();
  VoidCallback? onloadMore() => null;
  RefreshController refreshController() => RefreshController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
