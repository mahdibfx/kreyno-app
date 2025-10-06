import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/set_up_payment_methods/set_up_payment_methods_viewmodel.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:stacked/stacked.dart';

class SetUpPaymentMethodsEmptyState
    extends ViewModelWidget<SetUpPaymentMethodsViewModel> {
  const SetUpPaymentMethodsEmptyState({super.key});

  @override
  Widget build(BuildContext context, SetUpPaymentMethodsViewModel viewModel) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.px8),
      height: 180 * AppSpacing.px1,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.px12),
        border: Border.all(color: AppColors.strokeKre, width: 1.0),
      ),
      child: Container(
        padding: EdgeInsets.all(AppSpacing.px12),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(AppImages.bgCard),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(AppSpacing.px8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText.paragraph(
              CommonStrings.appName,
              color: AppColors.white.withValues(alpha: .3),
            ),
            CustomButton.filled(
              text: SetUpPaymentMethodsStrings.buttonLabel,
              icon: AppIcons.creditCardAdd,
              backgroundColor: AppColors.white,
              foregroundColor: AppColors.mainKre,
              borderRadius: AppSpacing.px12 / 2,
              onPressed: viewModel.onAddCardTapped,
            ),
          ],
        ),
      ),
    );
  }
}
