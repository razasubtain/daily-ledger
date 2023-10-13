import 'package:digi_app/app/app.dialogs.dart';
import 'package:digi_app/app/app.locator.dart';
import 'package:digi_app/models/wallet_model.dart';
import 'package:digi_app/services/wallet_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WalletListViewModel extends ReactiveViewModel {
  final service = NavigationService();
  final _walletService = locator<WalletService>();
  final _dialogService = locator<DialogService>();
  @override
  List<ListenableServiceMixin> get listenableServices => [_walletService];
  List<Wallet> get walletList => _walletService.walletList;
  getConfirmation(String walletId) async {
    DialogResponse? value = await _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Are you sure?',
      description:
          'Are you sure you want to delete this wallet?.This action can\'t be undo.',
    );
    if (value!.data == 'delete') {
      deleteWallet(walletId);
    }
    notifyListeners();
  }

  deleteWallet(String walletId) {
    _walletService.deleteWallet(walletId);
  }
}
