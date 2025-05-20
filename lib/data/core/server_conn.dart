import 'package:flutter_dotenv/flutter_dotenv.dart';

class ServerConn {
  // static final String url =
  //     Platform.isAndroid ? "http://10.0.2.2:5000" : dotenv.env['SERVER_URL']!;
  static final String url = dotenv.env['SERVER_URL']!;
}
