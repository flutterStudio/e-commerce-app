import 'package:e_commerce/src/model/story.model.dart';
import 'package:e_commerce/src/view/cms/stories/cms.stories.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StotyOptionsList extends GetView<CMSStoriesController> {
  const StotyOptionsList(this.story, {Key? key}) : super(key: key);
  final Story story;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(Icons.delete),
          title: Text("delete-story".tr),
          onTap: () {
            controller.deleteStory(story.id.toString());
          },
        ),
      ],
    );
  }
}
