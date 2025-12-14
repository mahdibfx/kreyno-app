import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/smart/vehicule_image_uploader/widgets/deleting_state.dart';
import 'package:kreyno/ui/widgets/smart/vehicule_image_uploader/widgets/failed_state.dart';
import 'package:kreyno/ui/widgets/smart/vehicule_image_uploader/widgets/idle_state.dart';
import 'package:kreyno/ui/widgets/smart/vehicule_image_uploader/widgets/success_state.dart';
import 'package:kreyno/ui/widgets/smart/vehicule_image_uploader/widgets/uploading_state.dart';
import 'package:stacked/stacked.dart';

import 'vehicule_image_uploader_model.dart';

class VehiculeImageUploader extends StackedView<VehiculeImageUploaderModel> {
  final Function(String uuid) onImageUploadSuccess;
  final Function(String errorMessage) onImageUploadFailure;
  final Function(bool isUploading) onImageUploading;
  final Function() onImageDeleteSuccess;
  final Function(String errorMessage) onImageDeleteFailure;
  final String? initialImageUrl;
  final String? initialImageUuid;

  const VehiculeImageUploader({
    super.key,
    required this.onImageUploadSuccess,
    required this.onImageUploadFailure,
    required this.onImageUploading,
    required this.onImageDeleteSuccess,
    required this.onImageDeleteFailure,
    this.initialImageUrl,
    this.initialImageUuid,
  });

  @override
  Widget builder(
    BuildContext context,
    VehiculeImageUploaderModel viewModel,
    Widget? child,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.px12 / 2,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText.smallParagraphMedium(
              SetUpVehiculeStrings.vehiculeImage,
              color: AppColors.textKre,
            ),
            CustomText.smallParagraphMedium(
              CommonStrings.optional,
              color: AppColors.mainKre,
            ),
          ],
        ),
        if (viewModel.isDeleting) ...[
          const DeletingState(),
        ] else if (viewModel.isUploading) ...[
          const UploadingState(),
        ] else if (viewModel.uploadedImageUuid != null) ...[
          const SuccessState(),
        ] else if (viewModel.errorMessage != null) ...[
          const IdleState(),
          const FailedState(),
        ] else ...[
          const IdleState(),
        ],
      ],
    );
  }

  @override
  void onViewModelReady(VehiculeImageUploaderModel viewModel) {
    if (initialImageUuid != null) {
      viewModel.setUploadedImageUuid(initialImageUuid);
    }
    super.onViewModelReady(viewModel);
  }

  @override
  VehiculeImageUploaderModel viewModelBuilder(BuildContext context) =>
      VehiculeImageUploaderModel(
        onImageUploadSuccess: onImageUploadSuccess,
        onImageUploadFailure: onImageUploadFailure,
        onImageUploading: onImageUploading,
        onImageDeleteSuccess: onImageDeleteSuccess,
        onImageDeleteFailure: onImageDeleteFailure,
      );
}
