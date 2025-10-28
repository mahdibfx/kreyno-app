import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'add_bank_account_viewmodel.dart';

class AddBankAccountView extends StackedView<AddBankAccountViewModel> {
  const AddBankAccountView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddBankAccountViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("AddBankAccountView")),
      ),
    );
  }

  @override
  AddBankAccountViewModel viewModelBuilder(BuildContext context) =>
      AddBankAccountViewModel();
}
