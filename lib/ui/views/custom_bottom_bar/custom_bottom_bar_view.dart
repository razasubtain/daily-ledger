import 'package:digi_app/app/app.router.dart';
import 'package:digi_app/ui/common/app_colors.dart';
import 'package:digi_app/ui/common/ui_helpers.dart';
import 'package:digi_app/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import 'custom_bottom_bar_viewmodel.dart';

class CustomBottomBarView extends StackedView<CustomBottomBarViewModel> {
  const CustomBottomBarView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CustomBottomBarViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () async {
        HomeViewModel().checkIsSearching(false);
        return true;
      },
      child: Scaffold(
        body: viewModel.page[viewModel.currentIndex],
        floatingActionButton: viewModel.currentIndex == 0
            ? viewModel.customerList.isEmpty
                ? Container()
                : Visibility(
                    visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                    child: InkWell(
                      onTap: () {
                        viewModel.service.navigateTo(Routes.addTransactionView);
                      },
                      child: Container(
                        height: buttonHeight,
                        width: 54,
                        decoration: BoxDecoration(
                          borderRadius: borderRadius,
                          color: buttonColor,
                        ),
                        child: const Icon(
                          Iconsax.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: viewModel.currentIndex,
            onTap: (value) {
              viewModel.setIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Iconsax.home,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.setting),
                label: '',
              ),
            ]),
      ),
    );
  }

  @override
  CustomBottomBarViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomBottomBarViewModel();
}
