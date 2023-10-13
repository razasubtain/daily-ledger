import 'dart:convert';

import 'package:digi_app/ui/common/app_colors.dart';
import 'package:digi_app/ui/common/app_strings.dart';
import 'package:digi_app/ui/common/ui_helpers.dart';
import 'package:digi_app/ui/views/add_transaction/widgets/cash_in_out_button.dart';
import 'package:digi_app/ui/views/add_transaction/widgets/customer_painter.dart';
import 'package:digi_app/ui/views/add_transaction/widgets/view_selected_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import '../../common/Global Widgets/common_textField_withTitle.dart';
import '../customer/customer_view.dart';
import 'add_transaction_viewmodel.dart';

class AddTransactionView extends StackedView<AddTransactionViewModel> {
  const AddTransactionView({
    Key? key,
    this.customerId = '',
    this.fromCustomerAccount = false,
    this.viewTransaction = false,
    this.transactionId = '',
  }) : super(key: key);
  final bool fromCustomerAccount;
  final String customerId;
  final String transactionId;
  final bool viewTransaction;
  @override
  Widget builder(
    BuildContext context,
    AddTransactionViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonAppBar(
            text: 'Add Transaction',
            trailing: viewTransaction
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            viewModel.makeEditAble();
                          },
                          icon: Icon(
                            Iconsax.receipt_edit,
                            color: viewModel.editTransaction
                                ? Colors.black
                                : Colors.red,
                          )),
                      horizontalSpaceTiny,
                      viewTransaction && viewModel.editTransaction
                          ? IconButton(
                              onPressed: () {
                                viewModel.getConfirmation(
                                    customerId, transactionId);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ))
                          : Container()
                    ],
                  )
                : Container(),
          ),
          preferredSize: const Size.fromHeight(60)),
      body: GestureDetector(
        onTap: () {
          viewModel.hideSearchingContainer();
        },
        child: ListView(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Form(
                      key: viewModel.formKey,
                      child: Column(
                        children: [
                          CommonTextField(
                            enabled: !fromCustomerAccount,
                            key: viewModel.globalKey,
                            ontap: viewModel.showSearchContainer,
                            cont: viewModel.customerName,
                            hintText: 'Enter Customer Name',
                            title: 'Customer Name ',
                            focusNode: viewModel.customerFocusNode,
                            nextFocusNode: viewModel.amountFocusNode,
                            searchField: true,
                            onChange: viewModel.isSearching,
                          ),
                          CommonTextField(
                            enabled: viewTransaction &&
                                    viewModel.editTransaction == false
                                ? false
                                : true,
                            maxLength: 10,
                            cont: viewModel.amount,
                            hintText: 'Enter Amount',
                            title: 'Enter Amount ',
                            inputType: TextInputType.number,
                            focusNode: viewModel.amountFocusNode,
                            nextFocusNode: viewModel.descriptionFocusNode,
                          ),
                        ],
                      ),
                    ),
                    CommonTextField(
                      enabled:
                          viewTransaction && viewModel.editTransaction == false
                              ? false
                              : true,
                      cont: viewModel.description,
                      hintText: 'Enter Description',
                      title: 'Enter Description (optional)',
                      focusNode: viewModel.descriptionFocusNode,
                      nextFocusNode: null,
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: viewModel.textFieldHeight,
                    ),
                    AnimatedContainer(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        color: addTransactionCard,
                      ),
                      duration: const Duration(milliseconds: 200),
                      height: viewModel.searchingHeight,
                      curve: Curves.easeOut,
                      child: viewModel.showSearchDropdown
                          ? Column(
                              children: [
                                SizedBox(
                                  height: viewModel.cancelDropDownButtonHeight,
                                  width: double.maxFinite,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            await viewModel
                                                .hideSearchingContainer();
                                          },
                                          icon: const Icon(
                                            Iconsax.close_circle,
                                            color: Colors.black,
                                          )),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: viewModel.searchList.isEmpty
                                      ? SizedBox(
                                          height: viewModel.dropDownTileHeight,
                                          child: const ListTile(
                                            title: Text(
                                              'No results found',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      : Scrollbar(
                                          thumbVisibility: true,
                                          interactive: true,
                                          controller:
                                              viewModel.scrollController,
                                          child: ListView.builder(
                                            controller:
                                                viewModel.scrollController,
                                            itemCount:
                                                viewModel.searchList.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  viewModel.selecCustomer(
                                                      viewModel
                                                          .searchList[index]);
                                                  viewModel
                                                      .hideSearchingContainer();
                                                },
                                                child: SizedBox(
                                                  height: viewModel
                                                      .dropDownTileHeight,
                                                  child: ListTile(
                                                    title: Text(viewModel
                                                            .searchList[index]
                                                            .customerName ??
                                                        ''),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                ),
                              ],
                            )
                          : Container(),
                    ),
                  ],
                )
              ],
            ),
            verticalSpaceMedium,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Select Wallet',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButton(
                value: viewModel.initialValue,
                isExpanded: true,
                underline: Container(),
                items: viewModel.walletList.map((e) {
                  return DropdownMenuItem(
                    enabled:
                        viewTransaction && viewModel.editTransaction == false
                            ? false
                            : true,
                    child: Text(
                      '${e.walletName} - ${e.walletNumber ?? ' '}',
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: e.id,
                  );
                }).toList(),
                onChanged: (value) {
                  viewModel.changeInitialValue(value.toString());
                },
              ),
            ),
            verticalSpaceMedium,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Transaction Proof',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  viewModel.imageData.isNotEmpty
                      ? viewTransaction && viewModel.editTransaction
                          ? IconButton(
                              onPressed: () {
                                viewModel.showBottomSheet();
                              },
                              icon: const Icon(
                                Iconsax.gallery_edit,
                                color: Colors.black,
                              ))
                          : Container()
                      : Container()
                ],
              ),
            ),
            verticalSpaceSmall,
            InkWell(
              onTap: viewTransaction && viewModel.editTransaction == false
                  ? () {}
                  : () {
                      viewModel.showBottomSheet();
                    },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 140,
                color: viewModel.imageData.isEmpty ? null : Colors.black,
                width: double.maxFinite,
                child: CustomPaint(
                    painter: DottedBorderPainter(),
                    child: viewModel.imageData.isEmpty
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              viewTransaction &&
                                      viewModel.editTransaction == false
                                  ? Container()
                                  : const Icon(
                                      Iconsax.add,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                              Text(
                                viewTransaction &&
                                        viewModel.editTransaction == false
                                    ? 'No image'
                                    : 'add image as proof',
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          )
                        : InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      ViewSelectedImage(
                                          customerName:
                                              viewModel.customerName.text,
                                          imageData: viewModel.imageData,
                                          viewModel: viewModel),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = const Offset(0.0, 1.0);
                                    var end = Offset.zero;
                                    var curve = Curves.ease;

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var offsetAnimation =
                                        animation.drive(tween);

                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Image.memory(
                              base64Decode(viewModel.imageData),
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                            ),
                          )),
              ),
            ),
            verticalSpaceLarge,
            viewTransaction && viewModel.editTransaction == false
                ? Container()
                : CashInOutButton(
                    cashInFunction: () {
                      if (viewModel.formKey.currentState!.validate()) {
                        if (viewModel.customerName.text ==
                            viewModel.selectedCustomer.customerName) {
                          if (viewModel.editTransaction) {
                            viewModel.editTransactionFunction(
                                transactionId, cashIn);
                          } else {
                            viewModel.addNewTransaction(cashIn);
                          }
                        } else {
                          viewModel.showSnackBar();
                        }
                      }
                    },
                    cashOutFunction: () {
                      if (viewModel.formKey.currentState!.validate()) {
                        if (viewModel.customerName.text ==
                            viewModel.selectedCustomer.customerName) {
                          if (viewModel.editTransaction) {
                            viewModel.editTransactionFunction(
                                transactionId, cashOut);
                          } else {
                            viewModel.addNewTransaction(cashOut);
                          }
                        } else {
                          viewModel.showSnackBar();
                        }
                      }
                    },
                  ),
            verticalSpaceLarge,
          ],
        ),
      ),
    );
  }

  @override
  AddTransactionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddTransactionViewModel();

  @override
  void onViewModelReady(AddTransactionViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getData(
          fromCustomerAccount, customerId, viewTransaction, transactionId);
    });
    super.onViewModelReady(viewModel);
  }
}
