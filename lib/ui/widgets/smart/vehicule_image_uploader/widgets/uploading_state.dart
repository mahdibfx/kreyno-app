import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/smart/vehicule_image_uploader/vehicule_image_uploader_model.dart';
import 'package:kreyno/ui/widgets/smart/vehicule_image_uploader/widgets/image_previewer.dart';
import 'package:stacked/stacked.dart';

class UploadingState extends ViewModelWidget<VehiculeImageUploaderModel> {
  const UploadingState({super.key});

  @override
  Widget build(BuildContext context, VehiculeImageUploaderModel viewModel) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(AppSpacing.px16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.px12),
        border: Border.all(color: AppColors.strokeKre),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 14 * AppSpacing.px1,
        children: [
          const ImagePreviewer.uploading(),
          CustomText.smallParagraphBold(
            SetUpVehiculeStrings.uploading,
            maxLines: 2,
          ),
          LinearProgressIndicator(
            color: AppColors.greenKre,
            backgroundColor: AppColors.disabledKre,
            borderRadius: BorderRadius.circular(10000),
            minHeight: AppSpacing.px8,
          ),
        ],
      ),
    );
  }
}
