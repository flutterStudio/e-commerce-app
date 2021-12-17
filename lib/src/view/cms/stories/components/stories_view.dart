import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/model/story.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:story_view/story_view.dart';

class StoriesView extends StatelessWidget {
  StoriesView({Key? key, required this.stories}) : super(key: key);
  final List<Story> stories;
  final StoryController _controller = StoryController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StoryView(
            controller: _controller,
            storyItems: stories
                .map((e) => e.mediaType == MediaType.video
                    ? StoryItem.pageVideo(e.attachment ?? "",
                        shown: true, controller: _controller)
                    : StoryItem.inlineImage(
                        url: e.attachment ?? "", controller: _controller))
                .toList()));
  }
}
