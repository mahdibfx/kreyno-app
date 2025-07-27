import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'spot_bought_success_viewmodel.dart';

class SpotBoughtSuccessView extends StackedView<SpotBoughtSuccessViewModel> {
  const SpotBoughtSuccessView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SpotBoughtSuccessViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SpotBoughtSuccessView")),
      ),
    );
  }

  @override
  SpotBoughtSuccessViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SpotBoughtSuccessViewModel();
}
