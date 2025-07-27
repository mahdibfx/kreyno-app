import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'my_vehicules_viewmodel.dart';

class MyVehiculesView extends StackedView<MyVehiculesViewModel> {
  const MyVehiculesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MyVehiculesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("MyVehiculesView")),
      ),
    );
  }

  @override
  MyVehiculesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyVehiculesViewModel();
}
