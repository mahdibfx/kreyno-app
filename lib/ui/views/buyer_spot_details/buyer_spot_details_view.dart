import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'buyer_spot_details_viewmodel.dart';

class BuyerSpotDetailsView extends StackedView<BuyerSpotDetailsViewModel> {
  const BuyerSpotDetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyerSpotDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("BuyerSpotDetailsView")),
      ),
    );
  }

  @override
  BuyerSpotDetailsViewModel viewModelBuilder(BuildContext context) =>
      BuyerSpotDetailsViewModel();
}
