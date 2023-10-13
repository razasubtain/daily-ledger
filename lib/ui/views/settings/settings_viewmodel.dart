import 'package:digi_app/app/app.locator.dart';
import 'package:digi_app/services/url_launcher_service.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel {
  final service = NavigationService();
  final _urlLauncher = locator<UrlLauncherService>();
  final dialog = locator<DialogService>();
  List<String> list = [];
  launchUrl() {
    _urlLauncher.launchUrl();
  }
}
