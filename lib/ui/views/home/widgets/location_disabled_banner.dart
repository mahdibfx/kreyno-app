import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/home/home_viewmodel.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:stacked/stacked.dart';

class LocationDisabledBanner extends ViewModelWidget<HomeViewModel> {
  const LocationDisabledBanner({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
      padding: EdgeInsets.all(5 * AppSpacing.px1),
      decoration: BoxDecoration(
        color: const Color(0xFF0F83EF),
        borderRadius: BorderRadius.circular(AppSpacing.px12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 9 * AppSpacing.px1),
            child: CustomText.smallParagraphBold(
              "Oups, localisation désactivée !",
              color: AppColors.white,
            ),
          ),
          GestureDetector(
            onTap: viewModel.onLocationServiceDisabledTapped,
            child: Container(
              width: 40 * AppSpacing.px1,
              height: 40 * AppSpacing.px1,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppSpacing.px8),
              ),
              child: Center(
                child: CustomIcon(
                  iconPath: AppIcons.arrowRightUp,
                  color: AppColors.mainKre,
                  size: AppSpacing.px24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
