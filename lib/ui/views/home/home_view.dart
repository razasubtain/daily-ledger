import 'package:digi_app/app/app.router.dart';
import 'package:digi_app/ui/common/Global%20Widgets/common_profile_widget.dart';
import 'package:digi_app/ui/common/app_colors.dart';
import 'package:digi_app/ui/common/ui_helpers.dart';
import 'package:digi_app/ui/views/customer/customer_view.dart';
import 'package:digi_app/ui/common/Global%20Widgets/image_with_below_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () async {
        if (viewModel.isSearching) {
          viewModel.checkIsSearching(false);
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: CommonAppBar(
              text: 'Daily Ledger',
              showLeading: false,
            )),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    viewModel.isSearching
                        ? Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  viewModel.checkIsSearching(false);
                                },
                                icon: const Icon(Iconsax.arrow_left)),
                          )
                        : Container(),
                    Expanded(
                      flex: 6,
                      child: CommonSearchField(
                        controller: viewModel.customerName,
                        onTap: () {
                          viewModel.checkIsSearching(true);
                        },
                        onChange: viewModel.isSearchingCustomer,
                      ),
                    ),
                  ],
                ),
                verticalSpaceSmall,
                viewModel.isSearching
                    ? const Padding(
                        padding: EdgeInsets.only(left: 22),
                        child: Text(
                          'Transactions',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(),
                viewModel.isSearching
                    ? Container()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpaceSmall,
                          Row(
                            children: [
                              // HomeScreenCard(
                              //     onTap: () {},
                              //     text: 'Expenses',
                              //     icon: Iconsax.add_square,
                              //     color: addTransactionCard),
                              HomeScreenCard(
                                  onTap: () => viewModel.service
                                      .navigateTo(Routes.customerView),
                                  text: 'Accounts',
                                  icon: Iconsax.profile_2user,
                                  color: customCard),
                              HomeScreenCard(
                                  onTap: () => viewModel.service
                                      .navigateTo(Routes.walletListView),
                                  text: 'Wallets',
                                  icon: Iconsax.wallet,
                                  color: walletCard),
                            ],
                          ),
                        ],
                      ),
                verticalSpaceSmall,
                viewModel.isSearching
                    ? Container()
                    : Row(
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Text(
                              'Today Activity',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                viewModel.viewAmountDialog(
                                    viewModel.cashIn, 'Cash In');
                              },
                              child: Column(
                                children: [
                                  const Text(
                                    'Cash In',
                                    style: TextStyle(
                                        color: cashInCard,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    viewModel.cashIn.toString(),
                                    style: const TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          ),
                          horizontalSpaceTiny,
                          Container(
                            height: 36,
                            width: 1,
                            color: Colors.black,
                          ),
                          horizontalSpaceTiny,
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                viewModel.viewAmountDialog(
                                    viewModel.cashOut, 'Cash Out');
                              },
                              child: Column(
                                children: [
                                  const Text(
                                    'Cash Out',
                                    style: TextStyle(
                                        color: cashOutCard,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    viewModel.cashOut.toString(),
                                    style: const TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                verticalSpaceSmall,
                viewModel.todayTransactions.isEmpty
                    ? viewModel.searchList.isEmpty
                        ? Expanded(
                            child: ListView(
                              children: const [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ImageWithBelowText(),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : const Expanded(
                            child: Center(
                              child: Text(
                                'No transactions found',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                    : Expanded(
                        child: ListView.builder(
                        itemCount: viewModel.todayTransactions.length,
                        padding: const EdgeInsets.only(bottom: 50),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              viewModel.service
                                  .navigateToCustomerTransactionView(
                                      customerId: viewModel
                                          .todayTransactions[index]
                                          .customerId!);
                            },
                            child: TransactionTile(
                              tileType: 'transaction',
                              amount:
                                  viewModel.todayTransactions[index].amount ??
                                      0.0,
                              cashType: viewModel.todayTransactions[index]
                                      .transactionType ??
                                  '',
                              image: viewModel
                                      .todayTransactions[index].customerImage ??
                                  '',
                              title: viewModel
                                      .todayTransactions[index].customerName ??
                                  '',
                            ),
                          );
                        },
                      ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.getData();

    super.onViewModelReady(viewModel);
  }
}

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    this.cashType = '',
    this.amount = 0.0,
    this.title = '',
    this.ledgerNo = '',
    this.subTitle = '',
    this.tileType = '',
    this.image = '',
    this.city = '',
  });
  final double amount;
  final String cashType;
  final String title;
  final String ledgerNo;
  final String subTitle;
  final String tileType;
  final String image;
  final String city;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: tileType == 'customer'
          ? EdgeInsets.only(bottom: city.isEmpty ? 6 : 4)
          : const EdgeInsets.all(0),
      child: ListTile(

          // shape: RoundedRectangleBorder(
          //     borderRadius: borderRadius,
          //     side: BorderSide(color: Colors.black.withOpacity(0.1))),
          leading: CommonProfileWidget(image: image, radius: 30),
          title: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(),
          ),
          subtitle: tileType == 'transaction'
              ? RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: cashType,
                        style: TextStyle(
                            color:
                                cashType == 'cashIn' ? cashInCard : cashOutCard,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const WidgetSpan(child: horizontalSpaceTiny),
                    TextSpan(
                        text: amount.toString(),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black)),
                  ]),
                  overflow: TextOverflow.ellipsis,
                )
              : city.isNotEmpty
                  ? Text(
                      city,
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    )
                  : null,
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: buttonColor,
            size: 16,
          )),
    );
  }
}

// Container(
//           height: 36,
//           width: 70,
//           decoration: BoxDecoration(
//             color: greenCard,
//             borderRadius: borderRadius,
//           ),
//           alignment: Alignment.center,
//           child: const FittedBox(child: Text('8977878')),
//         )
class CommonSearchField extends StatelessWidget {
  const CommonSearchField({
    super.key,
    required this.onTap,
    required this.onChange,
    required this.controller,
    this.hinText = 'Search Transaction',
  });
  final Function onTap;
  final String hinText;
  final Function onChange;
  final TextEditingController controller;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      height: buttonHeight,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: searchTextField,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 4),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          onChange();
        },
        onTap: () {
          onTap();
        },
        cursorColor: buttonColor,
        decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.only(right: 30, left: 10),
              child: Icon(
                Iconsax.search_normal,
                color: buttonColor,
                size: 26,
              ),
            ),
            hintText: hinText,
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.zero,
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}

class HomeScreenCard extends StatelessWidget {
  const HomeScreenCard(
      {super.key, this.icon, this.text, this.color, required this.onTap});
  final IconData? icon;
  final String? text;
  final Color? color;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Container(
            margin: const EdgeInsets.all(4),
            height: 140,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: color,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                verticalSpaceMedium,
                Text(
                  text ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                )
              ],
            ),
          ),
        ));
  }
}
