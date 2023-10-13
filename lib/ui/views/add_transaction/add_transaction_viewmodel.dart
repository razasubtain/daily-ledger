import 'package:digi_app/app/app.bottomsheets.dart';
import 'package:digi_app/app/app.dialogs.dart';
import 'package:digi_app/main.dart';
import 'package:digi_app/models/customer_model.dart';
import 'package:digi_app/models/transaction_model.dart';
import 'package:digi_app/models/wallet_model.dart';
import 'package:digi_app/services/customer_service.dart';
import 'package:digi_app/services/wallet_service.dart';
import 'package:digi_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class AddTransactionViewModel extends ReactiveViewModel {
  // @override
  // void dispose() {
  //   customerName.dispose();
  //   amount.dispose();
  //   description.dispose();
  //   description.dispose();
  //   scrollController.dispose();

  //   super.dispose();
  // }

  Customer selectedCustomer = Customer();

  final formKey = GlobalKey<FormState>();
  final service = NavigationService();
  final _snackBarService = locator<SnackbarService>();
  ScrollController scrollController = ScrollController();
  final _bottomSheetService = locator<BottomSheetService>();
  TextEditingController customerName = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController description = TextEditingController();
  FocusNode customerFocusNode = FocusNode();
  FocusNode amountFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();
  final _walletService = locator<WalletService>();
  final _customerService = locator<CustomerService>();
  final _dialogService = locator<DialogService>();
  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_walletService, _customerService];
  List<Wallet> get walletList => _walletService.walletList;
  List<Customer> get customerList => _customerService.customerList;

  String initialValue = '1';
  bool editTransaction = false;
  final globalKey = GlobalKey();
  List<Customer> searchList = [];
  String imageData = '';
  bool showSearchDropdown = false;
  double searchingHeight = 0;
  double dropDownTileHeight = 56;
  double cancelDropDownButtonHeight = 20;
  double textFieldHeight = 0.0;
  changeInitialValue(String value) {
    initialValue = value;

    rebuildUi();
  }

  makeEditAble() {
    editTransaction = !editTransaction;
    notifyListeners();
  }

  editTransactionFunction(String transactionId, String cashType) {
    final transaction = selectedCustomer.transactionList!
        .firstWhere((element) => element.id == transactionId);
    final wallet =
        walletList.firstWhere((element) => element.id == initialValue);
    transaction.amount = amount.text.toDouble();
    transaction.transactionDescprition = description.text;

    transaction.wallet = wallet;
    transaction.transactionProof = imageData;
    transaction.transactionType = cashType;
    _customerService.editTransaction(transactionId, transaction);
    service.back();
  }

  selecCustomer(Customer customer) {
    selectedCustomer = customer;
    customerName.text = customer.customerName ?? '';
  }

  addNewTransaction(String cashType) {
    final index =
        walletList.indexWhere((element) => element.id == initialValue);
    final wallet = walletList[index];
    final newTransaction = Transaction(
      customerImage: selectedCustomer.image,
      amount: amount.text.toDouble(),
      customerId: selectedCustomer.id,
      customerName: selectedCustomer.customerName,
      date:
          '${DateFormat('EE').format(DateTime.now())}, ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
      id: DateTime.now().toString(),
      transactionDescprition: description.text,
      transactionProof: imageData,
      transactionType: cashType,
      wallet: wallet,
      createdAt: DateFormat('ddMMyyyy').format(DateTime.now()),
    );
    p(newTransaction);
    _customerService.addNewTransaction(selectedCustomer.id!, newTransaction);

    service.back();
  }

  getData(
    bool fromCustomerAccount,
    String customerId,
    bool viewTransaction,
    String transactionId,
  ) {
    if (fromCustomerAccount) {
      final customer =
          customerList.firstWhere((element) => element.id == customerId);
      selectedCustomer = customer;
      customerName.text = customer.customerName ?? '';
      if (viewTransaction) {
        final transaction = customer.transactionList
            ?.firstWhere((element) => element.id == transactionId);

        amount.text = transaction!.amount.toString();
        description.text = transaction.transactionDescprition ?? '';
        p(transaction.wallet?.id);
        final walletIndex = _walletService.walletList
            .indexWhere((element) => element.id == transaction.wallet?.id);

        walletIndex != -1 ? initialValue = transaction.wallet!.id! : '1';

        imageData = transaction.transactionProof ?? '';
      }
    }

    notifyListeners();
  }

  void showBottomSheet() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
    );
    imageData = response?.data ?? imageData;
    rebuildUi();
  }

  showSnackBar() {
    _snackBarService.showSnackbar(
        message: 'Please enter valid customer Name',
        duration: const Duration(seconds: 3));
  }

  showSearchContainer() {
    if (showSearchDropdown == false) {
      getTextFieldHeight();
      showSearchDropdown = true;
      searchList = customerList;
      if (searchList.isEmpty) {
        searchingHeight = dropDownTileHeight + cancelDropDownButtonHeight;
      } else if (searchList.isNotEmpty &&
          dropDownTileHeight * searchList.length <
              MediaQuery.of(StackedService.navigatorKey!.currentContext!)
                      .size
                      .height *
                  0.3) {
        searchingHeight = (dropDownTileHeight * searchList.length) +
            cancelDropDownButtonHeight;
      } else {
        searchingHeight =
            MediaQuery.of(StackedService.navigatorKey!.currentContext!)
                    .size
                    .height *
                0.3;
      }

      notifyListeners();
    }
  }

  getConfirmation(String customerId, String transactionId) async {
    DialogResponse? value = await _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Are you sure?',
      description:
          'Are you sure you want to delete this transaction?.This action can\'t be undo.',
    );
    if (value!.data == 'delete') {
      deleteTransaction(customerId, transactionId);
    }
  }

  // bool isDeleted = false;
  // deleted() {
  //   isDeleted = true;
  //   notifyListeners();
  // }

  hideSearchingContainer() {
    showSearchDropdown = false;
    searchingHeight = 0.0;
    notifyListeners();
  }

  deleteTransaction(String customerId, String transactionId) {
    _customerService.deleteTransaction(customerId, transactionId);
    service.back();
  }

  isSearching() {
    showSearchDropdown = true;
    if (customerName.text.isEmpty) {
      searchList = customerList;
    }
    searchList = customerList
        .where((element) => element.customerName!
            .toLowerCase()
            .contains(customerName.text.toLowerCase()))
        .toList();
    if (searchList.isNotEmpty) {
      if ((dropDownTileHeight + cancelDropDownButtonHeight) *
              searchList.length >
          MediaQuery.of(StackedService.navigatorKey!.currentContext!)
                  .size
                  .height *
              0.3) {
        searchingHeight =
            MediaQuery.of(StackedService.navigatorKey!.currentContext!)
                    .size
                    .height *
                0.3;
      } else {
        searchingHeight = (dropDownTileHeight + cancelDropDownButtonHeight) *
            searchList.length.toDouble();
      }
    } else {
      searchingHeight = dropDownTileHeight + cancelDropDownButtonHeight;
    }
    notifyListeners();
  }

  getTextFieldHeight() {
    final renderBox = globalKey.currentContext!.findRenderObject() as RenderBox;
    textFieldHeight = renderBox.size.height;
    notifyListeners();
  }
}
