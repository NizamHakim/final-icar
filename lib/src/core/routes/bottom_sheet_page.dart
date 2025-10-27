import 'package:flutter/material.dart';

class BottomSheetPage<T> extends Page<T> {
  final Widget child;
  final bool showDragHandle;
  final bool useSafeArea;

  const BottomSheetPage({
    required this.child,
    this.showDragHandle = false,
    this.useSafeArea = true,
    super.key,
  });

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
    settings: this,
    isScrollControlled: true,
    showDragHandle: showDragHandle,
    useSafeArea: useSafeArea,
    backgroundColor: Colors.transparent,
    builder: (context) => child,
  );
}
