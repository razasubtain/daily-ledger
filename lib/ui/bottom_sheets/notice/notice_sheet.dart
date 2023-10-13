import 'package:digi_app/ui/bottom_sheets/notice/notice_sheet_model.dart';
import 'package:digi_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../common/image_utilities.dart';

class NoticeSheet extends StackedView<NoticeSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const NoticeSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NoticeSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Colors.white,
        ),
        height: 220,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 4,
                  width: 46,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.only(top: 6),
                )
              ],
            ),
            EditProfileBottomSheet(
                function: () async {
                  final image = await ImageUtilies.galleryImage();
                  image != null
                      ? completer!(SheetResponse(confirmed: true, data: image))
                      : null;
                },
                icon: Icons.image,
                title: 'Gallery'),
            EditProfileBottomSheet(
                function: () async {
                  final image = await ImageUtilies.cameraImage();
                  image != null
                      ? completer!(SheetResponse(confirmed: true, data: image))
                      : null;
                },
                icon: Icons.camera,
                title: 'Camera'),
            EditProfileBottomSheet(
                function: () {
                  final image = ImageUtilies.removeImage();
                  completer!(SheetResponse(confirmed: true, data: image));
                },
                icon: Icons.delete,
                title: 'Remove Image'),
          ],
        ));
  }

  @override
  NoticeSheetModel viewModelBuilder(BuildContext context) => NoticeSheetModel();
}

class EditProfileBottomSheet extends StatelessWidget {
  const EditProfileBottomSheet({
    Key? key,
    required this.function,
    this.icon,
    this.title,
  }) : super(key: key);
  final Function function;
  final IconData? icon;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
        // Navigator.pop(context);
      },
      leading: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blueGrey.withOpacity(0.1),
          child: Icon(
            icon,
            color: Colors.black,
            size: 22,
          )),
      title: Text(title!),
    );
  }
}
