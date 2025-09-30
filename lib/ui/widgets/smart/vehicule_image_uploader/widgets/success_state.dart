import 'package:flutter/widgets.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/smart/vehicule_image_uploader/vehicule_image_uploader_model.dart';
import 'package:stacked/stacked.dart';

import 'image_previewer.dart';

class SuccessState extends ViewModelWidget<VehiculeImageUploaderModel> {
  const SuccessState({super.key});

  @override
  Widget build(BuildContext context, VehiculeImageUploaderModel viewModel) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(
        top: AppSpacing.px8,
        left: AppSpacing.px8,
        right: AppSpacing.px16,
        bottom: AppSpacing.px8,
      ),
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
          ImagePreviewer.success(onDeleteTapped: viewModel.onDeleteImageTapped),
        ],
      ),
    );
  }
}
