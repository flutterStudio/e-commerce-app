import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/model/story.model.dart';
import 'package:e_commerce/src/view/cms/stories/cms.stories.controller.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:e_commerce/src/view/stories/components/story_list_item.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class StoriesGrid extends GetWidget<CMSStoriesController> {
  const StoriesGrid({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RequestHandler<List<Story>>(
        data: controller.stories.value,
        onSuccess: _onSucess,
        onEmpty: Center(
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_a_photo_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: ICONSIZE.lg,
              )),
        ),
      );
    });
  }

  Widget _onSucess(BuildContext context, List<Story> stories) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) => StoryListItem(
              height: 30,
              story: stories[index],
              onTap: () {},
            ));
  }
}
