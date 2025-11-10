import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/payout/payout_viewmodel.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';

class PayoutsHeader extends ViewModelWidget<PayoutViewModel> {
  const PayoutsHeader({super.key});

  @override
  Widget build(BuildContext context, PayoutViewModel viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(AppSpacing.px12),
          decoration: BoxDecoration(
            color: AppColors.backgroundInfo,
            borderRadius: BorderRadius.circular(AppSpacing.px12),
          ),
          child: Row(
            spacing: AppSpacing.px8,
            children: [
              CustomIcon(
                iconPath: AppIcons.infoCircleFilled,
                size: AppSpacing.px32,
                color: AppColors.textInfo,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2 * AppSpacing.px1,
                  children: [
                    CustomText.smallParagraphBold(
                      "Transferts les week-end uniquement",
                      color: AppColors.textInfo,
                      maxLines: 2,
                    ),
                    CustomText.labelRegular(
                      "Les retraits seront traités au prochain week-end.",
                      color: AppColors.textInfoSecondary,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        VGap(AppSpacing.px12),
        Container(
          padding: EdgeInsets.all(10 * AppSpacing.px1),
          decoration: BoxDecoration(
            color: const Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(AppSpacing.px12),
            border: Border.fromBorderSide(
              BorderSide(color: AppColors.strokeKre.withValues(alpha: 0.25)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.smallParagraphMedium(
                "Compte de",
                color: AppColors.textKre,
              ),
              Flexible(
                child: CustomText.smallParagraphBold(
                  '${viewModel.currentUser.firstName} ${viewModel.currentUser.lastName}',
                ),
              ),
            ],
          ),
        ),
        VGap(AppSpacing.px8),
        CustomText.smallParagraphMedium(
          "Saisissez le montant à transférer vers ce compte.",
          color: AppColors.textKre,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
