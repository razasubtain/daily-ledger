import 'package:digi_app/app/app.bottomsheets.dart';
import 'package:digi_app/app/app.dialogs.dart';
import 'package:digi_app/app/app.locator.dart';
import 'package:digi_app/models/customer_model.dart';
import 'package:digi_app/services/customer_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddCustomerViewModel extends BaseViewModel {
  final service = NavigationService();
  final _customerService = locator<CustomerService>();
  final _dialogService = locator<DialogService>();
  List<Customer> get customerList => _customerService.customerList;
  final focus = FocusNode();
  TextEditingController customerLedgerNo = TextEditingController();
  TextEditingController customerName = TextEditingController();

  TextEditingController customerCity = TextEditingController();
  TextEditingController customerNumber = TextEditingController();
  TextEditingController customerBusinessName = TextEditingController();

  FocusNode ledgerFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode cityFocusNode = FocusNode();
  FocusNode businessFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final _bottomSheetService = locator<BottomSheetService>();
  String? imageData;
  removeFoucs() {
    businessFocusNode.unfocus();
  }

  void showBottomSheet() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
    );
    imageData = response?.data ?? imageData;
    rebuildUi();
  }

  getConfirmation(String customerId) async {
    DialogResponse? value = await _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Are you sure?',
      description:
          'Are you sure you want to delete this customer?.All transactions related to this customer will be deleted.This action can\'t be undo',
    );
    if (value!.data == 'delete') {
      deleteCustomer(customerId);
    }
    notifyListeners();
  }

  addCustomer() {
    final newCustomer = Customer(
      businessName: customerBusinessName.text,
      city: customerCity.text,
      customerName: customerName.text,
      id: DateTime.now().toString(),
      image: imageData,
      ledgerNo: customerLedgerNo.text,
      phoneNumber: customerNumber.text,
    );
    _customerService.addCustomer(newCustomer);
    notifyListeners();
    service.back();
  }

  getData(String customerId, bool isEdit) {
    if (isEdit) {
      final customer =
          customerList.firstWhere((element) => element.id == customerId);
      customerName.text = customer.customerName ?? '';
      customerBusinessName.text = customer.businessName ?? '';
      customerCity.text = customer.city ?? '';
      customerNumber.text = customer.phoneNumber ?? '';
      imageData = customer.image ?? '';
      customerLedgerNo.text = customer.ledgerNo ?? '';
      notifyListeners();
    }
  }

  deleteCustomer(String customerId) {
    _customerService.deleteCustomer(customerId);
    service.back();
    service.back();
  }

  editCustomer(String customerId) {
    _customerService.editCustomerInformation(
      customerBusiness: customerBusinessName.text,
      customerCity: customerCity.text,
      customerId: customerId,
      customerLedgerNo: customerLedgerNo.text,
      customerName: customerName.text,
      customerphoneNumber: customerNumber.text,
      image: imageData ?? '',
    );
    service.back();
  }
}
