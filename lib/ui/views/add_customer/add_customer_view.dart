import 'package:digi_app/ui/common/app_colors.dart';
import 'package:digi_app/ui/common/ui_helpers.dart';
import 'package:digi_app/ui/views/customer/customer_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/Global Widgets/common_textField_withTitle.dart';
import '../../common/Global Widgets/common_profile_widget.dart';
import 'add_customer_viewmodel.dart';

class AddCustomerView extends StackedView<AddCustomerViewModel> {
  const AddCustomerView({Key? key, this.customerId = '', this.isEdit = false})
      : super(key: key);
  final String customerId;
  final bool isEdit;
  @override
  Widget builder(
    BuildContext context,
    AddCustomerViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonAppBar(
            text: isEdit ? 'Edit Customer' : 'Add Customer',
            trailing: isEdit
                ? IconButton(
                    onPressed: () {
                      viewModel.getConfirmation(customerId);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
                : Container(),
          ),
          preferredSize: const Size.fromHeight(60)),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  viewModel.showBottomSheet();
                },
                child: CommonProfileWidget(
                  image: viewModel.imageData ?? '',
                  radius: 50,
                ),
              ),
            ],
          ),
          verticalSpaceSmall,
          Form(
            key: viewModel.formKey,
            child: CommonTextField(
              cont: viewModel.customerName,
              hintText: 'Enter Customer Name',
              title: 'Customer Name',
              focusNode: viewModel.nameFocusNode,
              nextFocusNode: viewModel.cityFocusNode,
            ),
          ),
          CommonTextField(
            focusNode: viewModel.cityFocusNode,
            cont: viewModel.customerCity,
            hintText: 'Enter Customer\'s City',
            title: 'City (optional)',
            nextFocusNode: viewModel.ledgerFocusNode,
          ),
          CommonTextField(
            maxLength: 5,
            cont: viewModel.customerLedgerNo,
            hintText: 'Enter Customer\'s Ledger No#',
            inputType: TextInputType.number,
            title: 'Ledger No# (optional)',
            focusNode: viewModel.ledgerFocusNode,
            nextFocusNode: viewModel.phoneFocusNode,
          ),
          CommonTextField(
              focusNode: viewModel.phoneFocusNode,
              nextFocusNode: viewModel.businessFocusNode,
              cont: viewModel.customerNumber,
              hintText: 'Enter Customer\'s Phone Number',
              inputType: TextInputType.number,
              title: 'Phone Number (optional)'),
          CommonTextField(
              focusNode: viewModel.businessFocusNode,
              cont: viewModel.customerBusinessName,
              hintText: 'Enter Customer\'s Business Name',
              title: 'Business (optional)'),
          InkWell(
            onTap: () {
              if (viewModel.formKey.currentState!.validate()) {
                if (isEdit) {
                  viewModel.editCustomer(customerId);
                } else {
                  viewModel.addCustomer();
                }
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
              height: buttonHeight,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: borderRadius,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isEdit ? 'Save' : 'Add Customer',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  AddCustomerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddCustomerViewModel();
  @override
  void onViewModelReady(AddCustomerViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getData(customerId, isEdit);
    });
    super.onViewModelReady(viewModel);
  }
}
