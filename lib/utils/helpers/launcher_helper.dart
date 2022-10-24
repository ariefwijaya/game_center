import 'package:url_launcher/url_launcher.dart';

abstract class LauncherHelper {
  LauncherHelper._();
  static Future<bool> openUrl(String url, {bool openExternal = false}) async {
    try {
      return await launchUrl(Uri.parse(url),
          mode: openExternal
              ? LaunchMode.externalApplication
              : LaunchMode.platformDefault);
    } catch (e) {
      return false;
    }
  }

  static Future<bool> openEmailDraft(String email, {String? subject}) async {
    try {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: email,
        query: {'subject': subject ?? 'New Title Here'}
            .entries
            .map((e) =>
                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
            .join('&'),
      );

      return launchUrl(emailLaunchUri);
    } catch (e) {
      return false;
    }
  }
}
