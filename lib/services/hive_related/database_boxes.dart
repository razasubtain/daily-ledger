import 'package:digi_app/models/customer_model.dart';
import 'package:digi_app/models/transaction_model.dart';
import 'package:digi_app/models/wallet_model.dart';
import 'package:hive/hive.dart';

abstract class DatabaseBoxes {
  static registedAdapter() async {
    Hive.registerAdapter(CustomerAdapter());
    Hive.registerAdapter(TransactionAdapter());
    Hive.registerAdapter(WalletAdapter());
    await Hive.openBox('customerBox');
    await Hive.openBox('transactionBox');
    await Hive.openBox('walletBox');
    await Hive.openBox('todayTransactionBox');
  }

  final customerBox = Hive.box('customerBox');
  final transactionBox = Hive.box('transactionBox');
  final todayTransactionBox = Hive.box('todayTransactionBox');
  final walletBox = Hive.box('walletBox');
  final String todayTransactionData = 'todayTransactionData';
  final String customerData = 'customerData';
  final String walletData = 'walletData';
  deleteCustomerRelatedData() {
    customerBox.clear();
    transactionBox.clear();
    todayTransactionBox.clear();
  }

  deleteWalletData() {
    walletBox.clear();
  }

  deleteHardReset() {
    walletBox.deleteFromDisk();
  }
}
