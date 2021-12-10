import 'package:e_commerce/src/view/shared/file_uploader/componenets/file_item.dart';
import 'package:e_commerce/src/view/shared/file_uploader/file_uploader.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class FileUploaderList extends GetView<FileUploaderController> {
  const FileUploaderList(this.items, {Key? key}) : super(key: key);

  final List<FileUploaderItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: items.isEmpty
                ? const Text("Upload files")
                : Wrap(
                    children: items,
                  ))
      ],
    );
  }
}
