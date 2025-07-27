import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'add_payment_method_sheet_model.dart';

class AddPaymentMethodSheet extends StackedView<AddPaymentMethodSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const AddPaymentMethodSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddPaymentMethodSheetModel viewModel,
    Widget? child,
  ) {
    return SizedBox();
  }

  @override
  AddPaymentMethodSheetModel viewModelBuilder(BuildContext context) =>
      AddPaymentMethodSheetModel();
}
