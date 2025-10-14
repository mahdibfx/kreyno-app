import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'change_phone_number_viewmodel.dart';

class ChangePhoneNumberView extends StackedView<ChangePhoneNumberViewModel> {
  const ChangePhoneNumberView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChangePhoneNumberViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("ChangePhoneNumberView")),
      ),
    );
  }

  @override
  ChangePhoneNumberViewModel viewModelBuilder(BuildContext context) =>
      ChangePhoneNumberViewModel();
}
