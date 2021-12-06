import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin RefreshableMixin on StatelessWidget {
  Widget body(BuildContext context);
  Future<void> onRefresh();
  VoidCallback? onLoadMore() => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(child: body(context), onRefresh: onRefresh));
  }
}
