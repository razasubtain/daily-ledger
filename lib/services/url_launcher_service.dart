import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  launchUrl() async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path:
          'razasubtain53@gmail.com', // Replace with the recipient's email address
    );

    if (await canLaunchUrl(_emailLaunchUri)) {
      await launch(_emailLaunchUri.toString());
    } else {
      throw 'Could not launch email';
    }
  }
}
