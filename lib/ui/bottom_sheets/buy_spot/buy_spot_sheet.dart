import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'buy_spot_sheet_model.dart';

class BuySpotSheet extends StackedView<BuySpotSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const BuySpotSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuySpotSheetModel viewModel,
    Widget? child,
  ) {
    return SizedBox();
  }

  @override
  BuySpotSheetModel viewModelBuilder(BuildContext context) =>
      BuySpotSheetModel();
}
