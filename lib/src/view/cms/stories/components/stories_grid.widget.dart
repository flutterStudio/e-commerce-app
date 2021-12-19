import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/model/story.model.dart';
import 'package:e_commerce/src/view/cms/stories/cms.stories.controller.dart';
import 'package:e_commerce/src/view/cms/stories/components/add_story_from.compnent.dart';
import 'package:e_commerce/src/view/cms/stories/components/stories_view.dart';
import 'package:e_commerce/src/view/cms/stories/components/story_grid_item.widget.dart';
import 'package:e_commerce/src/view/cms/stories/components/story_options_list.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
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
        onErrorRetry: () {
          controller.getStories();
        },
        onEmpty: Center(
          child: _onEmpty(context),
        ),
      );
    });
  }

  Widget _onEmpty(BuildContext context) => IconButton(
      onPressed: () {
        showAddStoryBottomSheet(context);
      },
      icon: Icon(
        Icons.add_a_photo_rounded,
        color: Theme.of(context).colorScheme.primary,
        size: ICONSIZE.lg,
      ));

  Widget _onSucess(BuildContext context, List<Story> stories) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .7,
            mainAxisSpacing: SizeConfig.verticalSpace),
        scrollDirection: Axis.vertical,
        itemCount: stories.length + 1,
        itemBuilder: (context, index) => index == 0
            ? Container(
                margin: const EdgeInsets.only(right: 10),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.borderRadius),
                    color: Theme.of(context).colorScheme.secondaryVariant),
                child: IconButton(
                    onPressed: () {
                      showAddStoryBottomSheet(context);
                    },
                    icon: Icon(
                      Icons.add_a_photo_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: ICONSIZE.lg,
                    )))
            : StoryGridItem(
                story: stories[index - 1],
                onTapOptions: () {
                  showModalBottomSheet(
                      isScrollControlled: false,
                      isDismissible: true,
                      context: context,
                      builder: (context) =>
                          StotyOptionsList(stories[index - 1]));
                },
                onTap: () {
                  Get.to(StoriesView(
                    stories: stories,
                  ));
                },
              ));
  }

  void showAddStoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => const AddStoryForm());
  }
}
