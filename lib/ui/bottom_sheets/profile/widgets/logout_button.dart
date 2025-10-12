import 'package:flutter/material.dart';
import 'package:kreyno/ui/bottom_sheets/profile/profile_sheet_model.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:stacked/stacked.dart';

class LogoutButton extends ViewModelWidget<ProfileSheetModel> {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, ProfileSheetModel viewModel) {
    return FilledButton(
      style: FilledButton.styleFrom(
        fixedSize: Size(double.maxFinite, 40 * AppSpacing.px1),
        backgroundColor: AppColors.redKre.withValues(alpha: 0.05),
        foregroundColor: AppColors.redKre,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.redKre.withValues(alpha: 0.05),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(AppSpacing.px12),
        ),
        padding: EdgeInsets.all(10 * AppSpacing.px1),
      ),
      child: Row(
        spacing: 10 * AppSpacing.px1,
        children: [
          CustomIcon(
            iconPath: AppIcons.logout,
            color: AppColors.redKre,
            size: AppSpacing.px20,
          ),
          CustomText.smallParagraphBold(
            ProfileSheetStrings.logout,
            color: AppColors.redKre,
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
