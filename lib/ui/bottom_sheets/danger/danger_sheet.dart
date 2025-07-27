import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'danger_sheet_model.dart';

class DangerSheet extends StackedView<DangerSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const DangerSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DangerSheetModel viewModel,
    Widget? child,
  ) {
    return SizedBox();
  }

  @override
  DangerSheetModel viewModelBuilder(BuildContext context) => DangerSheetModel();
}
