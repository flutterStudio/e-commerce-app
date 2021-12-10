import 'dart:io';

import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/view/shared/custom_network_image.widget.dart';
import 'package:e_commerce/src/view/shared/file_uploader/componenets/file_uploader_info.dart';
import 'package:flutter/cupertino.dart';

class FileUploaderItem extends StatelessWidget {
  const FileUploaderItem({Key? key, required this.info}) : super(key: key);

  final FileUploaderInfo info;

  @override
  Widget build(BuildContext context) {
    switch (info.type) {
      case MediaType.image:
        {
          return _imageFile();
        }
      default:
        return Container();
    }
  }

  Widget _imageFile({File? file, String? url, String? placeholderAsset}) {
    assert(file == null && url == null && placeholderAsset == null,
        """file and url can not be both null,
     or You sould provide an asset to show as a placeholder .""");
    assert(file != null && url != null,
        "you can provide a file or a url, You can not use both.");

    if (file != null) {
      return Image.file(file);
    }
    if (url != null) {
      return CustomNetworkImage(
        url: url,
      );
    }
    if (placeholderAsset != null) {
      return Image.asset(placeholderAsset);
    }
    return Container();
  }
}
