import 'package:e_commerce/src/model/story.model.dart';
import 'package:e_commerce/src/view/shared/custom_network_image.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StoryListItem extends StatelessWidget {
  const StoryListItem({Key? key, required this.story, this.onTap})
      : super(key: key);
  final Story story;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.only(right: 10),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
                width: 2, color: Theme.of(context).colorScheme.primary)),
        child: CustomNetworkImage(
          url: story.attachment ?? "",
          erroPlaceholder: Icon(
            Icons.error,
            color: Theme.of(context).colorScheme.onError,
          ),
        ),
      ),
    );
  }
}
