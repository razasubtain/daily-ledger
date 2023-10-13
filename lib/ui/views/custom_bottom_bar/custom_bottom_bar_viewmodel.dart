import 'package:digi_app/app/app.locator.dart';
import 'package:digi_app/models/customer_model.dart';
import 'package:digi_app/services/customer_service.dart';
import 'package:digi_app/ui/views/home/home_view.dart';
import 'package:digi_app/ui/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomBottomBarViewModel extends IndexTrackingViewModel {
  final service = NavigationService();
  final _customerService = locator<CustomerService>();
  List<Widget> page = [
    const HomeView(),
    const SettingsView(),
  ];
  @override
  List<ListenableServiceMixin> get listenableServices => [_customerService];
  List<Customer> get customerList => _customerService.customerList;
}
