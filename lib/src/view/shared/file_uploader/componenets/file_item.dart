import 'dart:io';

import 'package:e_commerce/src/config/enums.dart';
import 'package:e_commerce/src/view/shared/custom_network_image.widget.dart';
import 'package:e_commerce/src/view/shared/file_uploader/componenets/file_uploader_info.dart';
import 'package:e_commerce/src/view/shared/file_uploader/file_uploader.controller.dart';
import 'package:e_commerce/src/view/shared/video_thumbnail.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FileUploaderItem extends StatelessWidget {
  const FileUploaderItem(
      {Key? key, required this.info, required this.controller})
      : super(key: key);

  final FileUploaderInfo info;
  final FileUploaderController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      fit: StackFit.loose,
      children: [
        _contentBuilder(context),
        info.status == FileUploadStatus.uploaded
            ? const Icon(
                Icons.cloud_upload,
                color: Colors.green,
              )
            : info.status == FileUploadStatus.faild
                ? IconButton(
                    onPressed: () {
                      controller.uploadFile(info);
                    },
                    icon: Icon(
                      Icons.replay_outlined,
                      color: Theme.of(context).errorColor,
                    ),
                  )
                : const CircularProgressIndicator()
      ],
    );
  }

  Widget _contentBuilder(BuildContext context) {
    switch (info.type) {
      case MediaType.image:
        {
          return _imageFile(file: info.file);
        }
      case MediaType.video:
        {
          return _videoFile(file: info.file);
        }
      default:
        return const Icon(Icons.file_upload);
    }
  }

  Widget _imageFile({File? file, String? url, String? placeholderAsset}) {
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

  Widget _videoFile({File? file, String? url}) {
    if (file != null) {
      return CustomVideoThumbnail(
        video: file,
      );
    }
    if (url != null) {
      return CustomVideoThumbnail(
        url: url,
      );
    }
    // if (placeholderAsset != null) {
    // return
    //  CustomVideoThumbnail(video: Asset,);
    // }
    return Container();
  }
}
