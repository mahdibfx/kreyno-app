import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/my_payment_methodes/my_payment_methodes_viewmodel.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';

class MyPaymentMethodesEmptyStateWidget
    extends ViewModelWidget<MyPaymentMethodesViewModel> {
  const MyPaymentMethodesEmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context, MyPaymentMethodesViewModel viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.paymentMethodsEmptyStateIllustration,
          height: 180 * AppSpacing.px1,
          width: 180 * AppSpacing.px1,
        ),
        VGap(AppSpacing.px24),
        CustomText.largeTitle(
          MyPaymentMethodesStrings.emptyStateTitle,
          maxLines: 3,
          textAlign: TextAlign.center,
        ),
        VGap(AppSpacing.px4),
        CustomText.smallParagraphMedium(
          MyPaymentMethodesStrings.emptyStateDescription,
          maxLines: 10,
          textAlign: TextAlign.center,
          color: AppColors.textKre,
        ),
        VGap(AppSpacing.px20),
        CustomButton.filled(
          text: MyPaymentMethodesStrings.addNewCard,
          onPressed: viewModel.onAddNewCardTapped,
        ),
      ],
    );
  }
}
