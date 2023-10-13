import 'package:digi_app/app/app.router.dart';
import 'package:digi_app/ui/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import '../../common/Global Widgets/common_profile_widget.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../customer/customer_view.dart';
import 'customer_transaction_viewmodel.dart';

class CustomerTransactionView
    extends StackedView<CustomerTransactionViewModel> {
  const CustomerTransactionView({Key? key, required this.customerId})
      : super(key: key);
  final String customerId;
  @override
  Widget builder(
    BuildContext context,
    CustomerTransactionViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          child: CommonAppBar(
            text: viewModel.customer.customerName ?? '',
            trailing: IconButton(
                onPressed: () {
                  viewModel.service.navigateToAddCustomerView(
                      customerId: viewModel.customer.id ?? '', isEdit: true);
                },
                icon: const Icon(
                  Iconsax.user_edit,
                  color: buttonColor,
                )),
          ),
          preferredSize: const Size.fromHeight(60)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CommonProfileWidget(
                    image: viewModel.customer.image ?? '', radius: 50),
                Column(
                  children: [
                    Text(
                      viewModel.textByCashDifference,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      viewModel.cashInOutDifference.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      viewModel.customerCashIn.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpaceTiny,
                    const Text(
                      'Total Cash In',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: cashInCard),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      viewModel.customerCashOut.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpaceTiny,
                    const Text(
                      'Total cash Out',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: cashOutCard),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            color: addTransactionCard,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Transactions',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        viewModel.customer.ledgerNo != null &&
                                viewModel.customer.ledgerNo!.isNotEmpty
                            ? 'ledger# ${viewModel.customer.ledgerNo}'
                            : '',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                verticalSpaceTiny,
                TransactionEntryTile(
                  tileHeight: 40,
                  startWidget: Text(
                      'Total Enteries ${viewModel.customer.transactionList?.length}'),
                  centerWidget: const Text(
                    'Cash In',
                    style: TextStyle(
                        color: cashInCard, fontWeight: FontWeight.bold),
                  ),
                  lastWidget: const Text(
                    'Cash Out',
                    style: TextStyle(
                        color: cashOutCard, fontWeight: FontWeight.bold),
                  ),
                ),
                verticalSpaceSmall,
              ],
            ),
          ),
          Expanded(
            child: viewModel.customer.transactionList!.isEmpty
                ? Container(
                    color: addTransactionCard,
                    child: const Center(
                      child: Text(
                        'No transactions found',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : Container(
                    color: addTransactionCard,
                    child: ListView.builder(
                      itemCount: viewModel.customer.transactionList?.length,
                      padding: const EdgeInsets.only(bottom: 80),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2,
                          ),
                          child: InkWell(
                            onTap: () {
                              viewModel.service.navigateToAddTransactionView(
                                  customerId: viewModel.customer.id ?? '',
                                  fromCustomerAccount: true,
                                  transactionId: viewModel.customer
                                          .transactionList![index].id ??
                                      '',
                                  viewTransaction: true);
                            },
                            child: TransactionEntryTile(
                              tileHeight: 56,
                              startWidget: Text(
                                viewModel
                                    .customer.transactionList![index].date!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              centerWidget: viewModel
                                          .customer
                                          .transactionList![index]
                                          .transactionType ==
                                      cashIn
                                  ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius: borderRadius,
                                        color: greenCard,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 8),
                                      child: Text(
                                        viewModel.customer
                                            .transactionList![index].amount
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  : null,
                              lastWidget: viewModel
                                          .customer
                                          .transactionList![index]
                                          .transactionType ==
                                      cashOut
                                  ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius: borderRadius,
                                        color: groceryCard,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 8),
                                      child: Text(
                                        viewModel.customer
                                            .transactionList![index].amount
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          viewModel.service.navigateToAddTransactionView(
            customerId: customerId,
            fromCustomerAccount: true,
          );
        },
        child: Container(
          height: buttonHeight,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: buttonColor,
          ),
          alignment: Alignment.center,
          child: const Text(
            'Add Transaction',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  CustomerTransactionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomerTransactionViewModel();
  @override
  void onViewModelReady(CustomerTransactionViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getCustomer(customerId);
    });
    super.onViewModelReady(viewModel);
  }
}

class TransactionEntryTile extends StatelessWidget {
  const TransactionEntryTile({
    super.key,
    this.tileHeight = 56,
    this.centerWidget,
    this.lastWidget,
    this.startWidget,
  });
  final double? tileHeight;
  final Widget? startWidget;
  final Widget? centerWidget;
  final Widget? lastWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: tileHeight,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
      ),
      child: Row(children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: startWidget ?? Container()),
        Container(
          width: lastWidget == null
              ? MediaQuery.of(context).size.width * 0.28
              : lastWidget != null
                  ? MediaQuery.of(context).size.width * 0.28
                  : MediaQuery.of(context).size.width * 0.0,
          alignment: Alignment.center,
          child: centerWidget ?? Container(),
        ),
        Container(
          width: centerWidget == null
              ? MediaQuery.of(context).size.width * 0.28
              : centerWidget != null
                  ? MediaQuery.of(context).size.width * 0.28
                  : MediaQuery.of(context).size.width * 0.0,
          alignment: Alignment.center,
          child: lastWidget ?? Container(),
        ),
      ]),
    );
  }
}
