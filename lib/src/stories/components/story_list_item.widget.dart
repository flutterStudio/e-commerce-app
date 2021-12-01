import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:story_view/story_view.dart';

class StoryListItem extends StatelessWidget {
  const StoryListItem({Key? key, required this.storyItem}) : super(key: key);
  final StoryItem storyItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // StoryView()
      },
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.only(right: 10),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
            border: Border.all(color: Theme.of(context).colorScheme.primary)),
        child: storyItem.view,
      ),
    );
  }
}
