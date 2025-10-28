import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'payout_viewmodel.dart';

class PayoutView extends StackedView<PayoutViewModel> {
  const PayoutView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PayoutViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("PayoutView")),
      ),
    );
  }

  @override
  PayoutViewModel viewModelBuilder(BuildContext context) => PayoutViewModel();
}
