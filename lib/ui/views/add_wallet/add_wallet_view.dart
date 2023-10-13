import 'package:digi_app/ui/common/Global%20Widgets/common_textField_withTitle.dart';
import 'package:digi_app/ui/common/app_colors.dart';
import 'package:digi_app/ui/common/ui_helpers.dart';
import 'package:digi_app/ui/views/customer/customer_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'add_wallet_viewmodel.dart';

class AddWalletView extends StackedView<AddWalletViewModel> {
  const AddWalletView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddWalletViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
          child: CommonAppBar(text: 'Add Wallets'),
          preferredSize: Size.fromHeight(60)),
      body: Column(
        children: [
          Form(
            key: viewModel.formKey,
            child: CommonTextField(
              cont: viewModel.walletName,
              hintText: 'Enter wallet Name',
              title: 'Wallet Name',
              focusNode: viewModel.currentNode,
              nextFocusNode: viewModel.nextNode,
            ),
          ),
          CommonTextField(
            nextFocusNode: null,
            focusNode: viewModel.nextNode,
            cont: viewModel.walletNumber,
            hintText: 'Enter wallet Number',
            title: 'Wallet Number(optional)',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          if (viewModel.formKey.currentState!.validate()) {
            viewModel.addWallet();
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
          child: const Text(
            'Save',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  AddWalletViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddWalletViewModel();
}
