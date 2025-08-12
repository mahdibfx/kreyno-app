import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'spot_sold_success_viewmodel.dart';

class SpotSoldSuccessView extends StackedView<SpotSoldSuccessViewModel> {
  const SpotSoldSuccessView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SpotSoldSuccessViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SpotSoldSuccessView")),
      ),
    );
  }

  @override
  SpotSoldSuccessViewModel viewModelBuilder(BuildContext context) =>
      SpotSoldSuccessViewModel();
}
