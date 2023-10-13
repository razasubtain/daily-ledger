import 'package:digi_app/app/app.locator.dart';
import 'package:digi_app/models/customer_model.dart';
import 'package:digi_app/services/customer_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomerTransactionViewModel extends ReactiveViewModel {
  final service = NavigationService();
  final _customerService = locator<CustomerService>();
  @override
  List<ListenableServiceMixin> get listenableServices => [_customerService];
  List<Customer> get customerList => _customerService.customerList;
  Customer get customer => _customerService.customer;
  double get customerCashIn => _customerService.customerTotalCashIn;
  double get customerCashOut => _customerService.customerTotalCashOut;
  double get cashInOutDifference => _customerService.totalCashDifference;
  String get textByCashDifference => _customerService.textByCashInCashOut;
  getCustomer(String customerId) {
    _customerService.getCustomer(customerId);
  }
}
