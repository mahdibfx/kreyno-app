import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'set_up_vehicule_viewmodel.dart';

class SetUpVehiculeView extends StackedView<SetUpVehiculeViewModel> {
  const SetUpVehiculeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SetUpVehiculeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SetUpVehiculeView")),
      ),
    );
  }

  @override
  SetUpVehiculeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SetUpVehiculeViewModel();
}
