import 'package:flutter/material.dart';
import 'package:kreyno/enums/supported_language.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/language_card.dart';
import 'package:kreyno/ui/widgets/dumb/loading_overlay.dart';
import 'package:stacked/stacked.dart';

import 'change_language_viewmodel.dart';

class ChangeLanguageView extends StackedView<ChangeLanguageViewModel> {
  const ChangeLanguageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChangeLanguageViewModel viewModel,
    Widget? child,
  ) {
    return LoadingOverlay(
      isShown: viewModel.isBusy,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: CustomScrollView(
          slivers: [
            CustomSliverAppBar.shrunk(
              title: ProfileSheetStrings.changeLanguage,
              onBackPressed: viewModel.goBack,
            ),

            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: AppSpacing.px4,
                  children: [
                    VGap(AppSpacing.px12),
                    LanguageCard(
                      type: LanguageCardType.english,
                      isOnDarkBackground: false,
                      isSelected:
                          viewModel.selectedLanguage.code ==
                          SupportedLanguage.en.code,
                      onTap: () =>
                          viewModel.setSelectedLanguage(SupportedLanguage.en),
                    ),
                    VGap(10 * AppSpacing.px1),
                    LanguageCard(
                      type: LanguageCardType.french,
                      isOnDarkBackground: false,
                      isSelected:
                          viewModel.selectedLanguage.code ==
                          SupportedLanguage.fr.code,
                      onTap: () =>
                          viewModel.setSelectedLanguage(SupportedLanguage.fr),
                    ),
                  ],
                ),
              ),
            ),

            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppSpacing.px16,
                    right: AppSpacing.px16,
                    bottom: AppSpacing.px20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton.filled(
                        text: CommonStrings.save,
                        size: CustomButtonSize.small,
                        onPressed: viewModel.hasLanguageChanged
                            ? viewModel.onSavePressed
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ChangeLanguageViewModel viewModelBuilder(BuildContext context) =>
      ChangeLanguageViewModel(context: context);
}
