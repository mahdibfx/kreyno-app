import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'rejection_reasons_sheet_model.dart';

class RejectionReasonsSheet extends StackedView<RejectionReasonsSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const RejectionReasonsSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RejectionReasonsSheetModel viewModel,
    Widget? child,
  ) {
    return SizedBox();
  }

  @override
  RejectionReasonsSheetModel viewModelBuilder(BuildContext context) =>
      RejectionReasonsSheetModel();
}
