import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/smart/vehicule_image_uploader/vehicule_image_uploader_model.dart';
import 'package:stacked/stacked.dart';

class ImagePreviewer extends ViewModelWidget<VehiculeImageUploaderModel> {
  final VoidCallback? onDeleteTapped;
  final VoidCallback? onRetryTapped;

  const ImagePreviewer.uploading({super.key})
    : onDeleteTapped = null,
      onRetryTapped = null;

  const ImagePreviewer.success({super.key, required this.onDeleteTapped})
    : onRetryTapped = null;

  const ImagePreviewer.failed({super.key, required this.onRetryTapped})
    : onDeleteTapped = null;

  @override
  Widget build(BuildContext context, VehiculeImageUploaderModel viewModel) {
    return viewModel.pickedImage != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: AppSpacing.px8,
            children: [
              Container(
                width: 60 * AppSpacing.px1,
                height: 40 * AppSpacing.px1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSpacing.px8),
                  border: Border.all(color: AppColors.strokeKre),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSpacing.px8),
                  child: Image.file(viewModel.pickedImage!, fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.smallParagraphMedium(
                      viewModel.pickedImage!.path
                          .split(Platform.pathSeparator)
                          .last,
                      color: AppColors.mainKre,
                    ),
                    if (onRetryTapped != null)
                      CustomText.smallParagraphMedium(
                        SetUpVehiculeStrings.errorRetry,
                        color: AppColors.redKre,
                      ),
                  ],
                ),
              ),
              if (onDeleteTapped != null || onRetryTapped != null)
                GestureDetector(
                  onTap: onDeleteTapped != null
                      ? onDeleteTapped!
                      : onRetryTapped!,

                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2 * AppSpacing.px1),
                    width: AppSpacing.px20,
                    height: AppSpacing.px20,
                    decoration: BoxDecoration(
                      color: AppColors.redKre.withValues(alpha: .1),
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.redKre, width: 1.5),
                    ),
                    child: Center(
                      child: CustomIcon(
                        iconPath: onDeleteTapped != null
                            ? AppIcons.multiplicationSign
                            : AppIcons.refresh,
                        size: AppSpacing.px16,
                        color: AppColors.redKre,
                      ),
                    ),
                  ),
                ),
            ],
          )
        : const SizedBox.shrink();
  }
}
