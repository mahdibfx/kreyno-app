import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'edit_vehicule_viewmodel.dart';

class EditVehiculeView extends StackedView<EditVehiculeViewModel> {
  const EditVehiculeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditVehiculeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("EditVehiculeView")),
      ),
    );
  }

  @override
  EditVehiculeViewModel viewModelBuilder(BuildContext context) =>
      EditVehiculeViewModel();
}
