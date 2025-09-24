import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'set_up_payment_methods_viewmodel.dart';

class SetUpPaymentMethodsView
    extends StackedView<SetUpPaymentMethodsViewModel> {
  const SetUpPaymentMethodsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SetUpPaymentMethodsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SetUpPaymentMethodsView")),
      ),
    );
  }

  @override
  SetUpPaymentMethodsViewModel viewModelBuilder(BuildContext context) =>
      SetUpPaymentMethodsViewModel();
}
