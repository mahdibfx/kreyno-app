import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'date_picker_filter_sheet_model.dart';

class DatePickerFilterSheet extends StackedView<DatePickerFilterSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const DatePickerFilterSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DatePickerFilterSheetModel viewModel,
    Widget? child,
  ) {
    return SizedBox();
  }

  @override
  DatePickerFilterSheetModel viewModelBuilder(BuildContext context) =>
      DatePickerFilterSheetModel();
}
