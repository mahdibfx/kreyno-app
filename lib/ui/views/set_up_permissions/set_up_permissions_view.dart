import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'set_up_permissions_viewmodel.dart';

class SetUpPermissionsView extends StackedView<SetUpPermissionsViewModel> {
  const SetUpPermissionsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SetUpPermissionsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SetUpPermissionsView")),
      ),
    );
  }

  @override
  SetUpPermissionsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SetUpPermissionsViewModel();
}
