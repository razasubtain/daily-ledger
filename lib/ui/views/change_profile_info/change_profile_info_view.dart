import 'package:digi_app/ui/common/Global%20Widgets/common_textField_withTitle.dart';
import 'package:digi_app/ui/views/customer/customer_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import 'change_profile_info_viewmodel.dart';

class ChangeProfileInfoView extends StackedView<ChangeProfileInfoViewModel> {
  const ChangeProfileInfoView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChangeProfileInfoViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const PreferredSize(
          child: CommonAppBar(text: 'Edit Name'),
          preferredSize: Size.fromHeight(60)),
      body: CommonTextField(
        cont: viewModel.cont,
        title: 'Enter Name',
        hintText: 'Enter Name',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        height: buttonHeight,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: buttonColor,
        ),
        alignment: Alignment.center,
        child: const Text(
          'Save',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(ChangeProfileInfoViewModel viewModel) {
    viewModel.initialize(
        ModalRoute.of(StackedService.navigatorKey!.currentState!.context)!
            .settings
            .arguments);
    super.onViewModelReady(viewModel);
  }

  @override
  ChangeProfileInfoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChangeProfileInfoViewModel();
}
