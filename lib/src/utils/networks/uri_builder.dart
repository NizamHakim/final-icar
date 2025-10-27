import 'package:icar/src/core/config/app_dot_env.dart';

Uri uriBuilder({
  required String endpoint,
  Map<String, dynamic>? queryParameters,
}) {
  final uri = Uri.parse("${AppDotEnv.httpUrl}$endpoint");

  if (queryParameters != null) {
    final params = <String, String>{};
    queryParameters.forEach((key, value) {
      if (value != null) params[key] = value.toString();
    });
    return uri.replace(queryParameters: params);
  }

  return uri;
}
