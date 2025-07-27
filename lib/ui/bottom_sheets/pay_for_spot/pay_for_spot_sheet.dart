import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'pay_for_spot_sheet_model.dart';

class PayForSpotSheet extends StackedView<PayForSpotSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const PayForSpotSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PayForSpotSheetModel viewModel,
    Widget? child,
  ) {
    return SizedBox();
  }

  @override
  PayForSpotSheetModel viewModelBuilder(BuildContext context) =>
      PayForSpotSheetModel();
}
