import 'package:digi_app/app/app.dialogs.dart';
import 'package:digi_app/app/app.locator.dart';
import 'package:digi_app/models/transaction_model.dart';
import 'package:digi_app/services/customer_service.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel {
  // final _dialogService = locator<DialogService>();

  final service = NavigationService();
  final _dialogService = locator<DialogService>();
  final _customerService = locator<CustomerService>();
  TextEditingController customerName = TextEditingController();
  @override
  List<ListenableServiceMixin> get listenableServices => [_customerService];
  List<Transaction> todayTransactions = [];
  List<Transaction> searchList = [];

  double get cashIn => _customerService.todayCashIn;
  double get cashOut => _customerService.todayCashOut;

  bool isSearching = false;
  bool hasFocus = false;
  checkIsSearching(bool value) {
    isSearching = value;
    hasFocus = value;
    if (value == false) {
      todayTransactions = _customerService.todayTransactions;
      customerName.clear();
    }
    notifyListeners();
  }

  isSearchingCustomer() {
    if (customerName.text.isEmpty) {
      todayTransactions = _customerService.todayTransactions;
    }
    todayTransactions = searchList
        .where((element) => element.customerName!
            .toLowerCase()
            .contains(customerName.text.toLowerCase()))
        .toList();
    notifyListeners();
  }

  viewAmountDialog(double amount, String description) {
    _dialogService.showCustomDialog(
      variant: DialogType.viewContent,
      title: description,
      description: amount.toString(),
    );
  }

  getData() {
    todayTransactions = _customerService.todayTransactions;
    searchList = _customerService.todayTransactions;

    notifyListeners();
  }
}
