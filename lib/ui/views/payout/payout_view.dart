import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_typography.dart';
import 'package:kreyno/ui/widgets/dumb/custom_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:stacked/stacked.dart';

import 'payout_viewmodel.dart';
import 'widgets/dial_pad.dart';

class PayoutView extends StackedView<PayoutViewModel> {
  const PayoutView({Key? key}) : super(key: key);

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
                  // TODO: make it selectable if client asked for it
                  // SelectableText(
                  //   viewModel.amount.isEmpty ? '0.00' : viewModel.amount,
                  //   style: AppTypography.largeTitle.copyWith(
                  //     fontSize: 48 * AppSpacing.px1,
                  //     fontWeight: FontWeight.bold,
                  //     color: viewModel.amount.isEmpty
                  //         ? AppColors.textKre
                  //         : AppColors.mainKre,
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: AppSpacing.px8,
                    children: [
                      Flexible(
                        child: CustomText.largeTitle(
                          viewModel.amount.isEmpty ? '0.00' : viewModel.amount,
                          fontSize: 48 * AppSpacing.px1,
                          color: viewModel.amount.isEmpty
                              ? AppColors.textKre
                              : AppColors.mainKre,
                        ),
                      ),
                      CustomText.title(
                        '€',
                        color: viewModel.amount.isEmpty
                            ? AppColors.textKre
                            : AppColors.mainKre,
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
