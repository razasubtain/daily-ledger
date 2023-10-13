import 'package:digi_app/app/app.dialogs.dart';
import 'package:digi_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DeleteAllDataViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  getConfirmation() async {
    final response = await _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'Warning!!!',
        description: 'Are you sure you want to delete all data?');
    if (response!.data == 'delete') {
      _dialogService.showCustomDialog(
        variant: DialogType.deletingProgress,
      );
    }
  }
}
