import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'checkout_money_feedback_sheet_model.dart';

class CheckoutMoneyFeedbackSheet
    extends StackedView<CheckoutMoneyFeedbackSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const CheckoutMoneyFeedbackSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CheckoutMoneyFeedbackSheetModel viewModel,
    Widget? child,
  ) {
    return BottomSheetLayout(
      showDragHandler: false,
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 11,
                backgroundColor: Color(0xFFF1F1F1),
                child: CustomIcon(
                  iconPath: AppIcons.multiplicationSign,
                  size: 18,
                ),
              ),
            ],
          ),
          Image.asset(
            request.data == "success"
                ? AppImages.successIllustration
                : AppImages.failIllustration,
            width: 128,
            height: 128,
          ),
          VGap(AppSpacing.px20),
          CustomText.largeTitle(
            request.data == "success" ? "Retrait confirmé" : "Échec du retrait",
          ),
          VGap(AppSpacing.px4),
          CustomText.smallParagraphMedium(
            request.data == "success"
                ? "Votre demande a été enregistrée. Vous recevrez votre virement sous peu."
                : "Une erreur est survenue. Veuillez réessayer ultérieurement.",
            color: AppColors.textKre,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          VGap(AppSpacing.px1 * 26),
          CustomButton.filled(
            text: request.data == "success" ? "Terminer" : "Ressayer",
            onPressed: () {},
          ),
          VGap(AppSpacing.px12),
        ],
      ),
    );
  }

  @override
  CheckoutMoneyFeedbackSheetModel viewModelBuilder(BuildContext context) =>
      CheckoutMoneyFeedbackSheetModel();
}
