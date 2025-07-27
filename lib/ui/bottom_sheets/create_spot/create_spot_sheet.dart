import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'create_spot_sheet_model.dart';

class CreateSpotSheet extends StackedView<CreateSpotSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const CreateSpotSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CreateSpotSheetModel viewModel,
    Widget? child,
  ) {
    return SizedBox();
  }

  @override
  CreateSpotSheetModel viewModelBuilder(BuildContext context) =>
      CreateSpotSheetModel();
}
