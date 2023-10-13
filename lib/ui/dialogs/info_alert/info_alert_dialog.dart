import 'package:digi_app/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:digi_app/ui/common/ui_helpers.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'info_alert_dialog_model.dart';

const double _graphicSize = 60;

class InfoAlertDialog extends StackedView<InfoAlertDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const InfoAlertDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    InfoAlertDialogModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () async {
        completer(DialogResponse(confirmed: true, data: 'back'));
        return true;
      },
      child: AlertDialog.adaptive(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(
              Iconsax.danger,
              size: 20,
              color: Colors.red,
            ),
            horizontalSpaceSmall,
            Text(
              'Warning!',
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(request.description ?? ''),
            verticalSpaceMedium,
            InkWell(
              onTap: () {
                completer(DialogResponse(confirmed: true, data: 'back'));
              },
              child: Container(
                height: buttonHeight,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: borderRadius,
                    border: Border.all(color: buttonColor)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
            verticalSpaceSmall,
            InkWell(
              onTap: () {
                completer(DialogResponse(confirmed: true, data: 'delete'));
              },
              child: Container(
                height: buttonHeight,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: borderRadius,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Delete',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        // actions: [
        //   TextButton(
        //       onPressed: () {
        //         completer(DialogResponse(confirmed: true, data: 'back'));
        //       },
        //       child: const Text('back')),
        //   TextButton(
        //       onPressed: () {
        //         completer(DialogResponse(confirmed: true, data: 'delete'));
        //       },
        //       child: const Text('delete')),
        // ],
      ),
    );
  }

  @override
  InfoAlertDialogModel viewModelBuilder(BuildContext context) =>
      InfoAlertDialogModel();
}
