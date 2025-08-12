import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'seller_spot_details_viewmodel.dart';

class SellerSpotDetailsView extends StackedView<SellerSpotDetailsViewModel> {
  const SellerSpotDetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerSpotDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SellerSpotDetailsView")),
      ),
    );
  }

  @override
  SellerSpotDetailsViewModel viewModelBuilder(BuildContext context) =>
      SellerSpotDetailsViewModel();
}
