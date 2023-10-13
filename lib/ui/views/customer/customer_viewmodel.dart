import 'package:digi_app/app/app.locator.dart';
import 'package:digi_app/models/customer_model.dart';
import 'package:digi_app/services/customer_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomerViewModel extends ReactiveViewModel {
  final service = NavigationService();
  TextEditingController customerName = TextEditingController();
  final _customerService = locator<CustomerService>();
  @override
  List<ListenableServiceMixin> get listenableServices => [_customerService];
  List<Customer> customer = [];
  List<Customer> searchList = [];
  getData() {
    customer = _customerService.customerList;
    searchList = _customerService.customerList;
    notifyListeners();
  }

  isSearchingCustomer() {
    if (customerName.text.isEmpty) {
      customer = _customerService.customerList;
    }
    customer = searchList
        .where((element) => element.customerName!
            .toLowerCase()
            .contains(customerName.text.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
