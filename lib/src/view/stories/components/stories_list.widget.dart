import 'package:e_commerce/src/view/stories/components/story_list_item.widget.dart';
import 'package:flutter/widgets.dart';
import 'package:story_view/story_view.dart';

class StoriesList extends StatelessWidget {
  const StoriesList({Key? key, required this.stories}) : super(key: key);
  final List<StoryItem> stories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stories.length,
            itemBuilder: (context, index) => StoryListItem(
                  storyItem: stories[index],
                )));
  }
}
