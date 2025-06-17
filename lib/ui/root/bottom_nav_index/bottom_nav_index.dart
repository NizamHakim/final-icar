import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_nav_index.g.dart';

@riverpod
class BottomNavIndex extends _$BottomNavIndex {
  @override
  int build(int initial) => initial;

  void set(int index) => state = index;
}
