import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/set_up_payment_methods/widgets/empty_state.dart';
import 'package:kreyno/ui/widgets/dumb/auth_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/credit_card.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/loading_overlay.dart';
import 'package:stacked/stacked.dart';

import 'set_up_payment_methods_viewmodel.dart';

class SetUpPaymentMethodsView
    extends StackedView<SetUpPaymentMethodsViewModel> {
  const SetUpPaymentMethodsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SetUpPaymentMethodsViewModel viewModel,
    Widget? child,
  ) {
    return LoadingOverlay(
      isShown: viewModel.isBusy,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: CustomScrollView(
            slivers: [
              AuthSliverAppBar(
                title: SetUpPaymentMethodsStrings.title,
                description: SetUpPaymentMethodsStrings.description,
                onBackPressed: viewModel.goBack,
                onSkipPressed: viewModel.hasSavedCard
                    ? null
                    : viewModel.onSkipTapped,
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
                sliver: SliverToBoxAdapter(
                  child: viewModel.hasSavedCard
                      ? CreditCard(card: viewModel.savedCard!)
                      : const SetUpPaymentMethodsEmptyState(),
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: AppSpacing.px16,
                      children: [
                        Row(
                          spacing: AppSpacing.px8,
                          children: [
                            CustomIcon(
                              iconPath: AppIcons.squareLock,
                              size: AppSpacing.px20,
                              color: AppColors.textKre,
                            ),
                            Expanded(
                              child: CustomText.smallParagraphMedium(
                                SetUpPaymentMethodsStrings
                                    .paymentMethodsDescription,
                                color: AppColors.textKre,
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                        CustomButton.filled(
                          text: CommonStrings.continueLabel,
                          onPressed: viewModel.onContinueTapped,
                          isDisabled: !viewModel.hasSavedCard,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SetUpPaymentMethodsViewModel viewModelBuilder(BuildContext context) =>
      SetUpPaymentMethodsViewModel();
}
