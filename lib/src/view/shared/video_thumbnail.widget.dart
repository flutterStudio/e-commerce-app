import 'dart:io';

import 'package:e_commerce/src/utils/file.utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomVideoThumbnail extends StatelessWidget {
  final File? video;
  final String? url;

  const CustomVideoThumbnail({Key? key, this.video, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Image?>(
        future: video == null
            ? FileUtils.getVideoThumbnail(url: url)
            : FileUtils.getVideoThumbnail(file: video),
        builder: (context, image) => image.hasError
            ? const Text("Error")
            : image.hasData
                ? image.data ?? Container()
                : const SizedBox.shrink(child: Placeholder()));
  }
}
