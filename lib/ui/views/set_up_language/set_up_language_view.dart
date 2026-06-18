import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/enums/supported_language.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/language_card.dart';
import 'package:kreyno/ui/widgets/dumb/app_logo.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';

import 'set_up_language_viewmodel.dart';

class SetUpLanguageView extends StackedView<SetUpLanguageViewModel> {
  const SetUpLanguageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SetUpLanguageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.mainKre,
      body: Padding(
        padding: EdgeInsets.only(
          left: AppSpacing.px16,
          right: AppSpacing.px16,
          // Add the bottom system inset so the continue button clears the
          // Android nav bar / home indicator.
          bottom: AppSpacing.px20 + MediaQuery.of(context).viewPadding.bottom,
          top: 144 * AppSpacing.px1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppLogo(animated: false),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText.largeTitle(
                  SetUpLanguageStrings.title,
                  color: AppColors.white,
                ),
                VGap(AppSpacing.px24),
                LanguageCard(
                  type: LanguageCardType.english,
                  isSelected:
                      context.locale.languageCode == SupportedLanguage.en.code,
                  onTap: () =>
                      viewModel.setSelectedLanguage(SupportedLanguage.en),
                ),
                VGap(10 * AppSpacing.px1),
                LanguageCard(
                  type: LanguageCardType.french,
                  isSelected:
                      context.locale.languageCode == SupportedLanguage.fr.code,
                  onTap: () =>
                      viewModel.setSelectedLanguage(SupportedLanguage.fr),
                ),
                VGap(2 * AppSpacing.px24),
              ],
            ),
            CustomButton.filled(
              text: CommonStrings.continueLabel,
              size: CustomButtonSize.large,
              onPressed: viewModel.onContinuePressed,
            ),
          ],
        ),
      ),
    );
  }

  @override
  SetUpLanguageViewModel viewModelBuilder(BuildContext context) =>
      SetUpLanguageViewModel(context: context);
}
