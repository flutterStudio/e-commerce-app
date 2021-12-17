import 'package:e_commerce/src/view/cms/stories/cms.stories.controller.dart';
import 'package:e_commerce/src/view/cms/stories/components/stories_grid.widget.dart';
import 'package:e_commerce/src/view/mixinx/refreshable.mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CMSStoriesScreen extends GetView<CMSStoriesController>
    with RefreshableMixin {
  const CMSStoriesScreen({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return const StoriesGrid();
  }

  @override
  Future<void> onRefresh() {
    return controller.getStories();
  }
}
