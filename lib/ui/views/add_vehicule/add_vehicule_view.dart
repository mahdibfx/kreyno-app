import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'add_vehicule_viewmodel.dart';

class AddVehiculeView extends StackedView<AddVehiculeViewModel> {
  const AddVehiculeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddVehiculeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("AddVehiculeView")),
      ),
    );
  }

  @override
  AddVehiculeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddVehiculeViewModel();
}
