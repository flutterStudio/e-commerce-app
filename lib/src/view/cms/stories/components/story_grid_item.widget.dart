import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/model/story.model.dart';
import 'package:e_commerce/src/view/shared/custom_network_image.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class StoryGridItem extends StatelessWidget {
  const StoryGridItem(
      {Key? key,
      required this.story,
      this.onTap,
      this.onLongPress,
      this.onTapOptions})
      : super(key: key);
  final Story story;
  final void Function()? onTap;
  final void Function()? onTapOptions;
  final void Function()? onLongPress;
  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
          leading: IconButton(
              onPressed: onTapOptions,
              icon: const Icon(
                Icons.more_horiz_outlined,
              ))),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            margin: const EdgeInsets.only(right: 10),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.borderRadius),
                color: Theme.of(context).colorScheme.secondaryVariant),
            child: _contentBuilder(context)),
      ),
    );
  }

  Widget _contentBuilder(BuildContext context) {
    switch (story.mediaType) {
      case MediaType.image:
        {
          return CustomNetworkImage(
            url: story.attachment ?? "",
            erroPlaceholder: Container(
              color: Theme.of(context).colorScheme.secondaryVariant,
            ),
          );
        }
      case MediaType.video:
        {
          return VideoPlayer(VideoPlayerController.network(
            story.attachment ?? "",
          )..initialize());
        }
      default:
        return Container(
          color: Theme.of(context).colorScheme.secondaryVariant,
        );
    }
  }
}
