import 'package:flutter/material.dart';
import 'package:kreyno/models/wallet.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/payout/widgets/payouts_header.dart';
import 'package:kreyno/ui/widgets/dumb/custom_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:stacked/stacked.dart';

import 'payout_viewmodel.dart';
import 'widgets/dial_pad.dart';

class PayoutView extends StackedView<PayoutViewModel> {
  final Wallet wallet;
  const PayoutView({Key? key, required this.wallet}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PayoutViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          CustomSliverAppBar.shrunk(
            title: "Retirer mon argent",
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
                                  : AppColors.mainKre,
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
                              'Solde disponible :',
                              color: AppColors.textKre,
                            ),
                          ),
                          CustomText.smallParagraphBold(
                            '${wallet.balance}€',
                            color: AppColors.mainKre,
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
      ),
    );
  }

  @override
  PayoutViewModel viewModelBuilder(BuildContext context) => PayoutViewModel();
}
