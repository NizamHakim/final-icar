import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_stop.g.dart';

@riverpod
class SearchStop extends _$SearchStop {
  @override
  String build() {
    return "";
  }

  void setSearchValue(String value) {
    state = value;
  }
}
