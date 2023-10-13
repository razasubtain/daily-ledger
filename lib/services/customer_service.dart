import 'package:digi_app/models/customer_model.dart';
import 'package:digi_app/models/transaction_model.dart';
import 'package:digi_app/services/hive_related/database_boxes.dart';
import 'package:digi_app/ui/common/app_strings.dart';
import 'package:intl/intl.dart';

import 'package:stacked/stacked.dart';

class CustomerService extends DatabaseBoxes with ListenableServiceMixin {
  List<Transaction> todayTransactions = [];
  double todayCashIn = 0.0;
  double todayCashOut = 0.0;
  double customerTotalCashIn = 0.0;
  double customerTotalCashOut = 0.0;
  Customer customer = Customer();
  List<Customer> customerList = [];
  double totalCashDifference = 0.0;
  String textByCashInCashOut = '';
  CustomerService() {
    listenToReactiveValues([customerList, todayTransactions]);

    final List customerlist = customerBox.get(
      customerData,
      defaultValue: [],
    );
    customerList = customerlist.cast<Customer>();
    final List<dynamic> todayTransactionList =
        todayTransactionBox.get(todayTransactionData, defaultValue: []);
    todayTransactions = todayTransactionList.cast<Transaction>();
    if (todayTransactions.isNotEmpty) {
      if (DateFormat('ddMMyyyy').format(DateTime.now()).toString() !=
          todayTransactions[0].createdAt) {
        todayTransactionBox.clear();
        todayTransactions.clear();
      }
    }
    calculateTodayCashInOut();
  }

  clear() {
    todayTransactions = [];
    todayCashIn = 0.0;
    todayCashOut = 0.0;
    customerTotalCashIn = 0.0;
    customerTotalCashOut = 0.0;
    customer = Customer();
    customerList = [];
    totalCashDifference = 0.0;
    textByCashInCashOut = '';
    deleteCustomerRelatedData();
    notifyListeners();
  }

  getCashInCashOutDifference() {
    if (customerTotalCashIn > customerTotalCashOut) {
      textByCashInCashOut = 'You owe';
      totalCashDifference = customerTotalCashIn - customerTotalCashOut;
    } else if (customerTotalCashIn < customerTotalCashOut) {
      textByCashInCashOut = 'Remaining';
      totalCashDifference = customerTotalCashOut - customerTotalCashIn;
    } else if (customerTotalCashIn == customerTotalCashOut &&
        customerTotalCashIn != 0 &&
        customerTotalCashOut != 0) {
      textByCashInCashOut = 'Amount is even';
      totalCashDifference = customerTotalCashOut - customerTotalCashIn;
    } else {
      textByCashInCashOut = 'No transactions found';
      totalCashDifference = 0.0;
    }
    notifyListeners();
  }

  deleteCustomer(String customerId) {
    customerList.removeWhere((element) => element.id == customerId);
    todayTransactions
        .removeWhere((element) => element.customerId == customerId);
    customerBox.put(customerData, customerList);
    todayTransactionBox.put(todayTransactionData, todayTransactions);
    transactionBox.delete(customerId);
    notifyListeners();
  }

  deleteTransaction(String customerId, String transactionId) {
    final index =
        customerList.indexWhere((element) => element.id == customerId);
    customerList[index]
        .transactionList!
        .removeWhere((element) => element.id == transactionId);
    final index1 =
        todayTransactions.indexWhere((element) => element.id == transactionId);
    if (index1 != -1) {
      todayTransactions.removeWhere((element) => element.id == transactionId);
      calculateTodayCashInOut();
    }

    calculateCustomerCashInOut(customerId);
    calculateTodayCashInOut();
    getCashInCashOutDifference();
    transactionBox.put(customerId, customerList[index].transactionList);
    todayTransactionBox.put(todayTransactionData, todayTransactions);
    notifyListeners();
  }

  getCustomer(String customerId) {
    final index =
        customerList.indexWhere((element) => element.id == customerId);
    customer = customerList[index];
    final List<dynamic> list = transactionBox.get(customerId, defaultValue: []);
    customer.transactionList = list.cast<Transaction>();
    calculateCustomerCashInOut(customerId);
    getCashInCashOutDifference();

    notifyListeners();
  }

  addCustomer(Customer? newCustomer) {
    customerList.insert(0, newCustomer!);
    customerBox.put(customerData, customerList);
    notifyListeners();
  }

  addNewTransaction(String customerId, Transaction newTransaction) {
    final index =
        customerList.indexWhere((element) => element.id == customerId);
    customerList[index].transactionList?.insert(0, newTransaction);
    todayTransactions.insert(0, newTransaction);
    calculateCustomerCashInOut(customerId);
    calculateTodayCashInOut();
    getCashInCashOutDifference();
    transactionBox.put(
        customerList[index].id, customerList[index].transactionList);
    todayTransactionBox.put(todayTransactionData, todayTransactions);
    notifyListeners();
  }

  calculateCustomerCashInOut(String customerId) {
    customerTotalCashIn = 0.0;
    customerTotalCashOut = 0.0;
    final index =
        customerList.indexWhere((element) => element.id == customerId);
    customerTotalCashIn =
        customerList[index].transactionList!.fold(0, (previousValue, element) {
      if (element.transactionType == cashIn) {
        return previousValue + element.amount!;
      }
      return previousValue;
    });
    customerTotalCashOut =
        customerList[index].transactionList!.fold(0, (previousValue, element) {
      if (element.transactionType == cashOut) {
        return previousValue + element.amount!;
      }
      return previousValue;
    });
    notifyListeners();
  }

  calculateTodayCashInOut() {
    todayCashIn = todayTransactions.fold(0, (previousValue, element) {
      if (element.transactionType == cashIn) {
        return previousValue + element.amount!;
      }
      return previousValue;
    });
    todayCashOut = todayTransactions.fold(0, (previousValue, element) {
      if (element.transactionType == cashOut) {
        return previousValue + element.amount!;
      }
      return previousValue;
    });
    notifyListeners();
  }

  editTransaction(String transactionId, Transaction transaction) {
    final customer = customerList
        .firstWhere((element) => element.id == transaction.customerId);
    final transactionIndex = customer.transactionList!
        .indexWhere((element) => element.id == transaction.id);
    customer.transactionList![transactionIndex] = transaction;

    final index =
        todayTransactions.indexWhere((element) => element.id == transactionId);
    index != -1 ? todayTransactions[index] = transaction : null;
    calculateTodayCashInOut();
    calculateCustomerCashInOut(transaction.customerId!);
    getCashInCashOutDifference();
    transactionBox.put(customer.id, customer.transactionList);
    todayTransactionBox.put(todayTransactionData, todayTransactions);
    notifyListeners();
  }

  editCustomerInformation(
      {String image = '',
      String customerName = '',
      String customerBusiness = '',
      String customerLedgerNo = '',
      String customerphoneNumber = '',
      String customerCity = '',
      String customerId = ''}) {
    final index =
        customerList.indexWhere((element) => element.id == customerId);
    customerList[index].businessName = customerBusiness;
    customerList[index].image = image;
    customerList[index].customerName = customerName;
    customerList[index].phoneNumber = customerphoneNumber;
    customerList[index].ledgerNo = customerLedgerNo;
    customerList[index].city = customerCity;
    final transactionIndex = todayTransactions
        .indexWhere((element) => element.customerId == customerId);
    if (transactionIndex != -1) {
      todayTransactions[transactionIndex].customerName = customerName;
      todayTransactions[transactionIndex].customerImage = image;
    }
    customerBox.put(customerData, customerList);
    notifyListeners();
  }
}
