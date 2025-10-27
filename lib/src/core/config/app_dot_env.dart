import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppDotEnv {
  static String get appEnv => dotenv.env['APP_ENV']!;
  static String get httpUrl {
    return (dotenv.env['APP_ENV']! == "production")
        ? "https://${dotenv.env['API_URL']!}"
        : "http://${dotenv.env['API_URL']!}";
  }

  static String get wsUrl {
    return (dotenv.env['APP_ENV']! == "production")
        ? "wss://${dotenv.env['API_URL']!}"
        : "ws://${dotenv.env['API_URL']!}";
  }

  static String get callHelpUrl => "tel:${dotenv.env['CONTACT_HELP']!}";
}
