import 'package:digi_app/ui/common/app_colors.dart';
import 'package:digi_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'deleting_progress_dialog_model.dart';

class DeletingProgressDialog extends StackedView<DeletingProgressDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const DeletingProgressDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DeletingProgressDialogModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: Container(
          margin: const EdgeInsets.all(20),
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (viewModel.compeleted) ...[
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                verticalSpaceSmall,
                const Text('Data deleted successfully!'),
              ],
              if (!viewModel.compeleted) ...[
                const Text(
                  'Deleting...',
                  textAlign: TextAlign.center,
                ),
                verticalSpaceSmall,
                SimpleAnimationProgressBar(
                  height: 30,
                  width: 300,
                  backgroundColor: Colors.grey.shade400,
                  foregrondColor: Colors.red,
                  ratio: 1,
                  direction: Axis.horizontal,
                  curve: Curves.linear,
                  duration: const Duration(seconds: 5),
                  borderRadius: BorderRadius.circular(10),
                ),
                verticalSpaceSmall,
                Text(
                  'Compeleting process in ${viewModel.seconds}',
                  textAlign: TextAlign.center,
                ),
              ],
              verticalSpaceLarge,
              InkWell(
                onTap: () {
                  if (viewModel.compeleted) {
                    viewModel.service.back();
                    viewModel.service.back();
                  } else {
                    viewModel.cancelTimer();
                    completer(DialogResponse(confirmed: true, data: 'cancel'));
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  height: buttonHeight,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: buttonColor,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    viewModel.compeleted ? 'Ok' : 'Cancel process',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  DeletingProgressDialogModel viewModelBuilder(BuildContext context) =>
      DeletingProgressDialogModel();
  @override
  void onViewModelReady(DeletingProgressDialogModel viewModel) {
    viewModel.startTimer();

    super.onViewModelReady(viewModel);
  }
}
