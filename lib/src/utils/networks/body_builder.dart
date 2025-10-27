import 'dart:convert';

String bodyBuilder(Map<String, dynamic> rawBody) {
  final filteredBody = <String, dynamic>{};

  rawBody.forEach((key, value) {
    if (value != null) {
      filteredBody[key] = value;
    }
  });

  return jsonEncode(filteredBody);
}
