import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/edit_profile/widgets/profile_image_updater/profile_image_updater_model.dart';
import 'package:kreyno/ui/views/edit_profile/widgets/profile_image_updater/widgets/profile_image_circle.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:stacked/stacked.dart';

class NoProfileImageState extends ViewModelWidget<ProfileImageUpdaterModel> {
  const NoProfileImageState({super.key});

  @override
  Widget build(BuildContext context, ProfileImageUpdaterModel viewModel) {
    return Row(
      spacing: AppSpacing.px12,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProfileImageCircle(
          imageUrl: viewModel.currentAvatar?.url,
          isLoading: viewModel.isBusy,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSpacing.px12,
            children: [
              CustomText.smallParagraphMedium(
                "Photo de profil",
                color: AppColors.textKre,
              ),
              CustomButton.filled(
                isDisabled: viewModel.isBusy,
                size: CustomButtonSize.small,
                text: "Ajouter",
                backgroundColor: AppColors.mainKre,
                foregroundColor: AppColors.white,
                onPressed: viewModel.onAddProfileImageTapped,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
