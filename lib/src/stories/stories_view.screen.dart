import 'package:flutter/widgets.dart';
import 'package:story_view/story_view.dart';

class StoriesViewScreen extends StatelessWidget {
  StoriesViewScreen({Key? key}) : super(key: key);
  final List<String> assets = [
    "assets/images/backbag1.png",
    "assets/images/backbag2.png",
    "assets/images/backbag3.png",
    "assets/images/backbag4-1.png",
    "assets/images/backbag4-2.png",
    "assets/images/backbag4-3.png",
  ];
  final StoryController _controller = StoryController();
  @override
  Widget build(BuildContext context) {
    return StoryView(
        controller: _controller,
        storyItems: assets
            .map((e) => StoryItem.inlineImage(url: e, controller: _controller))
            .toList());
  }
}
