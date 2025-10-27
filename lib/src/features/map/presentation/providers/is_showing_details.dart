import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_showing_details.g.dart';

@riverpod
class IsShowingDetail extends _$IsShowingDetail {
  @override
  bool build() {
    return false;
  }

  void setValue(bool newValue) {
    state = newValue;
  }
}
