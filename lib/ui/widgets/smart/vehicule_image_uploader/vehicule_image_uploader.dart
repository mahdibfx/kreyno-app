import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'vehicule_image_uploader_model.dart';

class VehiculeImageUploader extends StackedView<VehiculeImageUploaderModel> {
  final Function(String uuid) onImageUploadSuccess;
  final Function(String errorMessage) onImageUploadFailure;
  final Function(bool isUploading) onImageUploading;

  const VehiculeImageUploader({
    super.key,
    required this.onImageUploadSuccess,
    required this.onImageUploadFailure,
    required this.onImageUploading,
  });

  @override
  Widget builder(
    BuildContext context,
    VehiculeImageUploaderModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  VehiculeImageUploaderModel viewModelBuilder(BuildContext context) =>
      VehiculeImageUploaderModel();
}
