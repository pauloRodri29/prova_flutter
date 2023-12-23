import 'package:url_launcher/url_launcher.dart';

Future<void> launchInWebView(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.platformDefault)) {
    throw Exception('Sem acesso a página $url');
  }
}