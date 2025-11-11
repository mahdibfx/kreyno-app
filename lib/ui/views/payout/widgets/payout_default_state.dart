import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/payout/payout_viewmodel.dart';
import 'package:kreyno/ui/views/payout/widgets/dial_pad.dart';
import 'package:kreyno/ui/views/payout/widgets/payouts_header.dart';
import 'package:kreyno/ui/widgets/dumb/custom_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:stacked/stacked.dart';

class PayoutDefaultState extends ViewModelWidget<PayoutViewModel> {
  const PayoutDefaultState({super.key});

  @override
  Widget build(BuildContext context, PayoutViewModel viewModel) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        CustomSliverAppBar.shrunk(
          title: PayoutStrings.title,
          onBackPressed: viewModel.goBack,
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: AppSpacing.px16,
              left: AppSpacing.px16,
              right: AppSpacing.px16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                const PayoutsHeader(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: AppSpacing.px4,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: AppSpacing.px8,
                      children: [
                        Flexible(
                          child: CustomText.largeTitle(
                            viewModel.formattedAmount,
                            fontSize: 48 * AppSpacing.px1,
                            color: viewModel.amount.isEmpty
                                ? AppColors.placeholderKre
                                : viewModel.canWithdraw
                                ? AppColors.mainKre
                                : AppColors.redKre,
                          ),
                        ),
                        CustomText.title(
                          '€',
                          color: viewModel.amount.isEmpty
                              ? AppColors.placeholderKre
                              : AppColors.mainKre,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: AppSpacing.px4,
                      children: [
                        Flexible(
                          child: CustomText.smallParagraphMedium(
                            viewModel.canWithdraw
                                ? PayoutStrings.balanceAfterWithdraw
                                : PayoutStrings.availableBalance,
                            color: AppColors.textKre,
                          ),
                        ),
                        CustomText.smallParagraphBold(
                          viewModel.canWithdraw
                              ? '${viewModel.balanceAfterWithdraw}€'
                              : '${viewModel.balance}€',
                          color: viewModel.canWithdraw
                              ? AppColors.greenKre
                              : AppColors.mainKre,
                        ),
                      ],
                    ),
                  ],
                ),
                const DialPad(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
