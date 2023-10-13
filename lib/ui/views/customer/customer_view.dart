import 'package:digi_app/app/app.router.dart';
import 'package:digi_app/ui/common/Global%20Widgets/image_with_below_text.dart';
import 'package:digi_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../home/home_view.dart';
import 'customer_viewmodel.dart';

class CustomerView extends StackedView<CustomerViewModel> {
  const CustomerView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CustomerViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CommonAppBar(
            text: 'Accounts',
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceTiny,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CommonSearchField(
              controller: viewModel.customerName,
              onChange: viewModel.isSearchingCustomer,
              onTap: () {},
              hinText: 'Search Customer by name',
            ),
          ),
          verticalSpaceMedium,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Accounts',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          viewModel.customer.isEmpty
              ? viewModel.searchList.isEmpty
                  ? Expanded(
                      child: ListView(
                        children: const [
                          verticalSpaceLarge,
                          ImageWithBelowText(
                            imageUrl: 'assets/images/accounts.png',
                            text: 'Add accounts to track\nyour transactions',
                          ),
                        ],
                      ),
                    )
                  : const Expanded(
                      child: Center(
                        child: Text(
                          'No accounts found',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
              : Expanded(
                  child: ListView.builder(
                  itemCount: viewModel.customer.length,
                  padding: const EdgeInsets.only(bottom: 80),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        viewModel.service.navigateToCustomerTransactionView(
                            customerId: viewModel.customer[index].id!);
                      },
                      child: TransactionTile(
                        image: viewModel.customer[index].image ?? '',
                        title: viewModel.customer[index].customerName ?? '',
                        tileType: 'customer',
                        city: viewModel.customer[index].city ?? '',
                      ),
                    );
                  },
                ))
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          viewModel.service.navigateToAddCustomerView();
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
            'Add Customer',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  CustomerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomerViewModel();
  @override
  void onViewModelReady(CustomerViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getData();
    });
    super.onViewModelReady(viewModel);
  }
}

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    super.key,
    this.text = '',
    this.showLeading = true,
    this.trailing,
    this.backButtonFunction,
  });
  final String text;
  final bool showLeading;
  final Widget? trailing;
  final Function? backButtonFunction;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        trailing ?? Container(),
      ],
      title: Text(
        text,
        style: const TextStyle(
            fontFamily: 'Mont',
            color: Colors.black,
            fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      ),
      leading: showLeading
          ? IconButton(
              onPressed: () {
                backButtonFunction == null
                    ? Navigator.of(context).pop()
                    : backButtonFunction!();
              },
              icon: const Icon(
                Iconsax.arrow_square_left,
                color: Colors.black,
              ))
          : Container(),
    );
  }
}
