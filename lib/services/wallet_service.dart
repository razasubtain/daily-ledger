import 'package:digi_app/models/wallet_model.dart';
import 'package:digi_app/services/hive_related/database_boxes.dart';

import 'package:stacked/stacked.dart';

class WalletService extends DatabaseBoxes with ListenableServiceMixin {
  List<Wallet> walletList = [];
  final String firstWalletId = '1';
  WalletService() {
    listenToReactiveValues(walletList);

    final List<dynamic> list = walletBox.get(walletData, defaultValue: [
      Wallet(id: firstWalletId, walletName: 'None'),
    ]);
    walletList = list.cast<Wallet>();
  }
  clear() {
    walletList = [
      Wallet(id: '1', walletName: 'None'),
    ];
    deleteWalletData();
    notifyListeners();
  }

  addWallet(Wallet? wallet) {
    walletList.add(wallet!);
    walletBox.put(walletData, walletList);
    notifyListeners();
  }

  deleteWallet(String walletId) {
    walletList.removeWhere((element) => element.id == walletId);
    walletBox.put(walletData, walletList);
    notifyListeners();
  }
}
