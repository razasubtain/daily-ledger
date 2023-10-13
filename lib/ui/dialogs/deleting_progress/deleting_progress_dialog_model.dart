import 'dart:async';

import 'package:digi_app/app/app.locator.dart';
import 'package:digi_app/services/customer_service.dart';
import 'package:digi_app/services/wallet_service.dart';
import 'package:digi_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DeletingProgressDialogModel extends BaseViewModel {
  final service = NavigationService();
  final _customerService = locator<CustomerService>();
  final _walletService = locator<WalletService>();
  late Timer timer;
  int seconds = 5;
  bool compeleted = false;
  startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        seconds--;
        p(seconds);
        if (seconds == 0) {
          timer.cancel();
          deleteAllData();
          deletedSuccessfully();
        }
        notifyListeners();
      },
    );
  }

  cancelTimer() {
    timer.cancel();
  }

  deletedSuccessfully() {
    compeleted = true;
    notifyListeners();
  }

  deleteAllData() {
    _customerService.clear();
    _walletService.clear();
  }
}
