import 'package:digi_app/app/app.router.dart';
import 'package:digi_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../customer/customer_view.dart';
import 'wallet_list_viewmodel.dart';

class WalletListView extends StackedView<WalletListViewModel> {
  const WalletListView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WalletListViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const PreferredSize(
          child: CommonAppBar(text: 'All Wallets'),
          preferredSize: Size.fromHeight(60)),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 80),
        itemCount: viewModel.walletList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Material(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: borderRadius),
              child: ListTile(
                shape: RoundedRectangleBorder(borderRadius: borderRadius),
                title: Text(
                  viewModel.walletList[index].walletName ?? '',
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: index == 0
                    ? null
                    : IconButton(
                        onPressed: () {
                          viewModel
                              .getConfirmation(viewModel.walletList[index].id!);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                subtitle: viewModel.walletList[index].walletNumber == null ||
                        viewModel.walletList[index].walletNumber!.isEmpty
                    ? null
                    : Text(
                        viewModel.walletList[index].walletNumber ?? '',
                        style: const TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: InkWell(
        onTap: () {
          viewModel.service.navigateTo(Routes.addWalletView);
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
            'Add Wallet',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  WalletListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WalletListViewModel();
}
