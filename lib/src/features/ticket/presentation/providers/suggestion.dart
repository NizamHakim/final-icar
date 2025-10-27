import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'suggestion.g.dart';

@riverpod
class Suggestion extends _$Suggestion {
  @override
  String build() {
    return '';
  }

  void setSuggestion(String suggestion) {
    state = suggestion;
  }
}
