import 'package:icar/core/app_dot_env.dart';

Uri uriBuilder({
  required String endpoint,
  Map<String, dynamic>? queryParameters,
}) {
  final uri = Uri.parse("${AppDotEnv.httpUrl}$endpoint");
  if (queryParameters != null) {
    return uri.replace(
      queryParameters: queryParameters.map(
        (key, value) => MapEntry(key, "$value"),
      ),
    );
  }

  return uri;
}
