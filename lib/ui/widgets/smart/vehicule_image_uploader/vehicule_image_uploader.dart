import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'vehicule_image_uploader_model.dart';

class VehiculeImageUploader extends StackedView<VehiculeImageUploaderModel> {
  const VehiculeImageUploader({super.key});

  @override
  Widget builder(
    BuildContext context,
    VehiculeImageUploaderModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  VehiculeImageUploaderModel viewModelBuilder(
    BuildContext context,
  ) =>
      VehiculeImageUploaderModel();
}
