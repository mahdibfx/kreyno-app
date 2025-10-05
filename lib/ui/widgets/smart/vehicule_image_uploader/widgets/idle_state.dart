import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/smart/vehicule_image_uploader/vehicule_image_uploader_model.dart';
import 'package:stacked/stacked.dart';

class IdleState extends ViewModelWidget<VehiculeImageUploaderModel> {
  const IdleState({super.key});

  @override
  Widget build(BuildContext context, VehiculeImageUploaderModel viewModel) {
    return GestureDetector(
      onTap: viewModel.showImagePickerSheet,
      child: DottedBorder(
        radius: Radius.circular(AppSpacing.px12),
        strokeWidth: 1,
        borderType: BorderType.RRect,
        dashPattern: const [5, 5],
        color: AppColors.strokeKre,
        child: Container(
          color: Colors.transparent,
          width: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSpacing.px20,
              horizontal: 14 * AppSpacing.px1,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: AppSpacing.px20,
              children: [
                DottedBorder(
                  radius: const Radius.circular(1000000),
                  strokeWidth: 1,
                  borderType: BorderType.RRect,
                  dashPattern: const [5, 5],
                  color: AppColors.placeholderKre,
                  child: Padding(
                    padding: EdgeInsets.all(14 * AppSpacing.px1),
                    child: CustomIcon(
                      iconPath: AppIcons.upload,
                      size: 21 * AppSpacing.px1,
                      color: AppColors.placeholderKre,
                    ),
                  ),
                ),
                CustomText.labelRegular(
                  SetUpVehiculeStrings.acceptedFormats,
                  color: AppColors.textKre,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
