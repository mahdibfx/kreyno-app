import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'cancelation_reasons_sheet_model.dart';

class CancelationReasonsSheet
    extends StackedView<CancelationReasonsSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const CancelationReasonsSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CancelationReasonsSheetModel viewModel,
    Widget? child,
  ) {
    return SizedBox();
  }

  @override
  CancelationReasonsSheetModel viewModelBuilder(BuildContext context) =>
      CancelationReasonsSheetModel();
}
