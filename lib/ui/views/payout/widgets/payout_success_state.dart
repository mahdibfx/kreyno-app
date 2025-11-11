import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/payout/payout_viewmodel.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';

class PayoutSuccessState extends ViewModelWidget<PayoutViewModel> {
  const PayoutSuccessState({super.key});

  @override
  Widget build(BuildContext context, PayoutViewModel viewModel) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: viewModel.goBack,
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.only(
                  right: AppSpacing.px16,
                  top: AppSpacing.px20,
                ),
                alignment: Alignment.centerLeft,
                child: CustomIcon(
                  iconPath: AppIcons.arrowLeft,
                  size: AppSpacing.px24,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.successIllustration,
                  height: 128 * AppSpacing.px1,
                  width: 128 * AppSpacing.px1,
                ),
                VGap(AppSpacing.px20),
                CustomText.largeTitle(
                  PayoutStrings.successTitle,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                VGap(AppSpacing.px4),
                CustomText.smallParagraphMedium(
                  PayoutStrings.successDescription,
                  maxLines: 10,
                  textAlign: TextAlign.center,
                  color: AppColors.textKre,
                ),
                VGap(AppSpacing.px20),
                CustomButton.filled(
                  text: PayoutStrings.goToHome,
                  size: CustomButtonSize.large,
                  onPressed: viewModel.onGoToHomeTapped,
                ),
              ],
            ),
            VGap(AppSpacing.px32),
          ],
        ),
      ),
    );
  }
}
