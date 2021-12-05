import 'package:e_commerce/src/controller/stories.controller.dart';
import 'package:e_commerce/src/model/story.model.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:e_commerce/src/view/stories/components/story_list_item.widget.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class StoriesList extends GetWidget<StoriesController> {
  const StoriesList({Key? key, required this.height}) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RequestHandler<List<Story>>(
        data: controller.allCompaniesStories.value,
        onSuccess: _onSucess,
      );
    });
  }

  SizedBox _onSucess(BuildContext context, List<Story> stories) {
    return SizedBox(
        height: height,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stories.length,
            itemBuilder: (context, index) => StoryListItem(
                  height: height - 10,
                  story: stories[index],
                  onTap: () {
                    stories[index].userId == null
                        ? null
                        : controller.setCurrentCompany(stories[index].userId!);
                  },
                )));
  }
}
