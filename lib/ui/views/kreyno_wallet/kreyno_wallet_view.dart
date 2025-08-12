import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'kreyno_wallet_viewmodel.dart';

class KreynoWalletView extends StackedView<KreynoWalletViewModel> {
  const KreynoWalletView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    KreynoWalletViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("KreynoWalletView")),
      ),
    );
  }

  @override
  KreynoWalletViewModel viewModelBuilder(BuildContext context) =>
      KreynoWalletViewModel();
}
