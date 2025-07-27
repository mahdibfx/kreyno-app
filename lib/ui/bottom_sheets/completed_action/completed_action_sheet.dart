import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'completed_action_sheet_model.dart';

class CompletedActionSheet extends StackedView<CompletedActionSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;

  const CompletedActionSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CompletedActionSheetModel viewModel,
    Widget? child,
  ) {
    return SizedBox();
  }

  @override
  CompletedActionSheetModel viewModelBuilder(BuildContext context) =>
      CompletedActionSheetModel();
}
