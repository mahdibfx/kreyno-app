import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'upload_vehicule_image_sheet_model.dart';

class UploadVehiculeImageSheet
    extends StackedView<UploadVehiculeImageSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const UploadVehiculeImageSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UploadVehiculeImageSheetModel viewModel,
    Widget? child,
  ) {
    return SizedBox();
  }

  @override
  UploadVehiculeImageSheetModel viewModelBuilder(BuildContext context) =>
      UploadVehiculeImageSheetModel();
}
