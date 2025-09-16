import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/input_field.dart';
import 'package:kreyno/ui/widgets/dumb/my_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'checkout_money_viewmodel.dart';

class CheckoutMoneyView extends StackedView<CheckoutMoneyViewModel> {
  const CheckoutMoneyView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CheckoutMoneyViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.px24,
          vertical: AppSpacing.px20,
        ).copyWith(bottom: AppSpacing.px32),
        child: CustomButton.filled(
          onPressed: () async {
            final d = await locator<BottomSheetService>().showCustomSheet(
              data: "error",
              variant: BottomSheetType.checkoutMoneyFeedback,
            );
          },
          text: "Retirer",
        ),
      ),
      backgroundColor: AppColors.white,
      appBar: MyAppBar(title: "Retirer mon argent"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
        child: Column(
          children: [
            VGap(AppSpacing.px12),
            Container(
              padding: EdgeInsets.all(AppSpacing.px12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.fromBorderSide(
                  BorderSide(color: AppColors.textKre.withValues(alpha: 0.25)),
                ),
              ),
              child: Container(
                width: double.infinity,
                height: AppSpacing.px1 * 99,
                padding: EdgeInsets.all(AppSpacing.px16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage(AppImages.bgCard),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.smallParagraphMedium(
                      "Votre balance",
                      color: AppColors.placeholderKre,
                    ),
                    CustomText.largeTitle("33.25€", color: Colors.white),
                  ],
                ),
              ),
            ),
            VGap(AppSpacing.px24),
            InputField(
              controller: TextEditingController(),
              focusNode: FocusNode(),
              labelText: "IBAN",
              hintText: "",
              keyboardType: TextInputType.text,
            ),
            VGap(AppSpacing.px16),
            const CustomDivider(),
            VGap(AppSpacing.px16),
            InputField(
              controller: TextEditingController(),
              focusNode: FocusNode(),
              labelText: "Montant de retrait",
              hintText: "",
              suffixWidget: const Padding(
                padding: EdgeInsets.all(12),
                child: CustomIcon(
                  iconPath: AppIcons.euro,
                  color: AppColors.textKre,
                ),
              ),
              keyboardType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }

  @override
  CheckoutMoneyViewModel viewModelBuilder(BuildContext context) =>
      CheckoutMoneyViewModel();
}
