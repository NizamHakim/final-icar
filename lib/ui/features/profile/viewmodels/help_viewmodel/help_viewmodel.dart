import 'package:icar/core/app_dot_env.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> callHelp() async {
  final url = Uri.parse(AppDotEnv.callHelpUrl);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
