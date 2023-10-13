import 'package:digi_app/app/app.locator.dart';
import 'package:digi_app/services/url_launcher_service.dart';
import 'package:stacked/stacked.dart';

class ViewPolicyViewModel extends BaseViewModel {
  final _launchUrlService = locator<UrlLauncherService>();
  final String privacyPolicy =
      'Thank you so much for taking your time to read our privacy policy.As per our privacy policy we do not collect,use or share any of your data.All of your data is stored in your device and you can delete it whenever you want.If you have any query related to this app or you want to give us any feedback to improve this app we would be happy to hear from you.You can contact us by clicking the button below.Be kind to everyone and have a great day.';
  launchUrl() {
    _launchUrlService.launchUrl();
  }
}
