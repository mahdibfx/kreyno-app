import 'package:flutter/material.dart';

class StateRestorer extends StatefulWidget {
  final Widget child;
  final void Function(RestorationBucket? oldBucket, bool initialRestore)?
  onRestoreState;
  final String? restorationId;

  const StateRestorer({
    super.key,
    required this.child,
    this.onRestoreState,
    this.restorationId,
  });

  @override
  State<StateRestorer> createState() => _StateRestorerState();
}

class _StateRestorerState extends State<StateRestorer> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    widget.onRestoreState?.call(oldBucket, initialRestore);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
