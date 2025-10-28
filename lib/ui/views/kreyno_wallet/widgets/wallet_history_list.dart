import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/common/responsive_sizer.dart';
import 'package:kreyno/ui/views/kreyno_wallet/kreyno_wallet_viewmodel.dart';
import 'package:kreyno/ui/views/kreyno_wallet/widgets/empty_state.dart';
import 'package:kreyno/ui/views/kreyno_wallet/widgets/transaction_card.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_loading_indicator.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/error_state_widget.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:stacked/stacked.dart';

class WalletHistoryList extends ViewModelWidget<KreynoWalletViewModel> {
  const WalletHistoryList({super.key});

  @override
  Widget build(BuildContext context, KreynoWalletViewModel viewModel) {
    return MultiSliver(
      children: [
        SliverPersistentHeader(
          pinned: true,
          delegate: _WalletHistoryListHeaderDelegate(
            onFilterTapped: viewModel.showFilterSheet,
            isFilterApplied: viewModel.hasFilter,
          ),
        ),
        SliverToBoxAdapter(child: VGap(AppSpacing.px12)),
        if (viewModel.isBusy)
          SliverToBoxAdapter(
            child: SizedBox(
              height: 40.dh,
              child: Center(
                child: CustomLoadingIndicator(size: 64 * AppSpacing.px1),
              ),
            ),
          )
        else if (viewModel.hasError)
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
            sliver: SliverToBoxAdapter(
              child: ErrorStateWidget(
                errorMessage: viewModel.modelError ?? '',
                onRetryTapped: viewModel.fetchTransactions,
              ),
            ),
          )
        else if (!viewModel.hasTransactions)
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
            sliver: SliverToBoxAdapter(
              child: SizedBox(height: 40.dh, child: const EmptyHistoryState()),
            ),
          )
        else ...[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.px16,
              vertical: AppSpacing.px4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: viewModel.sortedMonthKeys.map((monthKey) {
                final transactions = viewModel.getTransactionsForMonth(
                  monthKey,
                );

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText.labelMedium(monthKey, color: AppColors.textKre),
                    VGap(AppSpacing.px12),
                    ...transactions.map(
                      (transaction) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TransactionCard(transaction: transaction),
                          VGap(AppSpacing.px8),
                        ],
                      ),
                    ),

                    VGap(AppSpacing.px20),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ],
    );
  }
}

class _WalletHistoryListHeaderDelegate extends SliverPersistentHeaderDelegate {
  final VoidCallback onFilterTapped;
  final bool isFilterApplied;

  _WalletHistoryListHeaderDelegate({
    required this.onFilterTapped,
    required this.isFilterApplied,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VGap(AppSpacing.px20),
          const CustomDivider(),
          VGap(AppSpacing.px24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText.paragraph(WalletStrings.transactionHistory),
                GestureDetector(
                  onTap: onFilterTapped,
                  child: Stack(
                    children: [
                      CustomIcon(
                        iconPath: AppIcons.sort,
                        size: AppSpacing.px24,
                      ),
                      if (isFilterApplied)
                        Positioned(
                          right: 0,
                          child: Container(
                            width: AppSpacing.px8,
                            height: AppSpacing.px8,
                            decoration: const BoxDecoration(
                              color: AppColors.redKre,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          VGap(AppSpacing.px8),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 77 * AppSpacing.px1;

  @override
  double get minExtent => 77 * AppSpacing.px1;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
