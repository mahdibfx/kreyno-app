import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'spots_history_viewmodel.dart';

class SpotsHistoryView extends StackedView<SpotsHistoryViewModel> {
  const SpotsHistoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SpotsHistoryViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SpotsHistoryView")),
      ),
    );
  }

  @override
  SpotsHistoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SpotsHistoryViewModel();
}
