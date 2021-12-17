import 'package:e_commerce/src/config/size.config.dart';
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
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: SizeConfig.horizontalSpace,
                            mainAxisSpacing: SizeConfig.verticalSpace,
                            crossAxisCount: 4,
                            childAspectRatio: 1),
                    scrollDirection: Axis.vertical,
                    itemCount: items.length,
                    itemBuilder: (context, index) => items[index],
                  ))
      ],
    );
  }
}
