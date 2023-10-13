import 'package:digi_app/app/app.locator.dart';
import 'package:digi_app/models/wallet_model.dart';
import 'package:digi_app/services/wallet_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddWalletViewModel extends BaseViewModel {
  final walletName = TextEditingController();
  final walletNumber = TextEditingController();
  final currentNode = FocusNode();
  final nextNode = FocusNode();
  final _service = NavigationService();
  final _walletSerivce = locator<WalletService>();
  final formKey = GlobalKey<FormState>();
  addWallet() {
    final wallet = Wallet(
      id: DateTime.now().toString(),
      walletName: walletName.text,
      walletNumber: walletNumber.text,
    );
    _walletSerivce.addWallet(wallet);
    _service.back();
  }
}
