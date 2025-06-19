import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppDotEnv {
  static final String httpUrl = "https://${dotenv.env['SERVER_URL']!}";
  static final String wsUrl = "wss://${dotenv.env['SERVER_URL']!}";
  static final String callHelpUrl = "tel:${dotenv.env['CALL_HELP']!}";
}
