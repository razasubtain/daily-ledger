import 'package:digi_app/ui/common/Global%20Widgets/image_with_below_text.dart';
import 'package:digi_app/ui/common/app_colors.dart';
import 'package:digi_app/ui/common/ui_helpers.dart';
import 'package:digi_app/ui/views/customer/customer_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'view_policy_viewmodel.dart';

class ViewPolicyView extends StackedView<ViewPolicyViewModel> {
  const ViewPolicyView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ViewPolicyViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CommonAppBar(
            text: 'Welcome',
          )),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          verticalSpaceSmall,
          const ImageWithBelowText(
            imageUrl: 'assets/images/hi.png',
            text: 'Hi there!\nHope you are doing great',
          ),
          verticalSpaceMedium,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              viewModel.privacyPolicy,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () async {
          await viewModel.launchUrl();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
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
                'Contact Us',
                style: TextStyle(fontSize: 18, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  ViewPolicyViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ViewPolicyViewModel();
}
