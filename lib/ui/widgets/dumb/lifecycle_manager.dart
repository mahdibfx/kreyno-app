import 'package:flutter/material.dart';

class LifeCycleManager extends StatefulWidget {
  final Widget child;
  final Function(AppLifecycleState state) didChangeAppLifecycleState;
  const LifeCycleManager({
    super.key,
    required this.child,
    required this.didChangeAppLifecycleState,
  });

  @override
  State<LifeCycleManager> createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      widget.didChangeAppLifecycleState(state);

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
