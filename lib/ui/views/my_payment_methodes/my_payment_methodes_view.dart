import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'my_payment_methodes_viewmodel.dart';

class MyPaymentMethodesView extends StackedView<MyPaymentMethodesViewModel> {
  const MyPaymentMethodesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MyPaymentMethodesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("MyPaymentMethodesView")),
      ),
    );
  }

  @override
  MyPaymentMethodesViewModel viewModelBuilder(BuildContext context) =>
      MyPaymentMethodesViewModel();
}
