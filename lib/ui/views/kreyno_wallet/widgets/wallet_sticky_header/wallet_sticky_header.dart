import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/kreyno_wallet/widgets/wallet_sticky_header/widgets/balance_card.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:stacked/stacked.dart';

import 'wallet_sticky_header_model.dart';

class WalletStickyHeader extends StackedView<WalletStickyHeaderModel> {
  final Function(bool success) onPayoutSuccess;
  const WalletStickyHeader({super.key, required this.onPayoutSuccess});

  @override
  Widget builder(
    BuildContext context,
    WalletStickyHeaderModel viewModel,
    Widget? child,
  ) {
    return MultiSliver(
      children: [
        SliverPersistentHeader(
          pinned: true,
          delegate: _WalletStickyHeaderDelegate(
            balance: viewModel.balance,
            currency: viewModel.currency,
            partiallyVisibleBankAccountNumber:
                viewModel.partiallyVisibleBankAccountNumber,
            isLoading: viewModel.isBusy,
            errorMessage: viewModel.modelError,
            onRetry: viewModel.fetchWallet,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
          sliver: SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VGap(AppSpacing.px12),
                if (viewModel.hasBankAccount) ...[
                  CustomButton.filled(
                    text: WalletStrings.withdrawMyMoney,
                    icon: AppIcons.cardReceive,
                    onPressed: viewModel.onPayoutTapped,
                    isDisabled: viewModel.isBusy || viewModel.hasError,
                  ),
                  VGap(AppSpacing.px16),
                  GestureDetector(
                    onTap: viewModel.isBusy || viewModel.hasError
                        ? null
                        : viewModel.onRemoveBankAccountTapped,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: AppSpacing.px4),
                      color: Colors.transparent,
                      child: CustomText.smallParagraphBold(
                        WalletStrings.removeMyBankAccount,
                        color: viewModel.isBusy || viewModel.hasError
                            ? AppColors.placeholderKre
                            : AppColors.textKre,
                        textDecoration: TextDecoration.underline,
                        textDecorationColor: AppColors.textKre,
                      ),
                    ),
                  ),
                ] else ...[
                  CustomButton.filled(
                    text: WalletStrings.addBankAccount,
                    icon: AppIcons.bank,
                    backgroundColor: const Color(0xFFFAFAFA),
                    foregroundColor: AppColors.mainKre,
                    border: BorderSide(
                      color: AppColors.strokeKre.withValues(alpha: 0.25),
                    ),
                    onPressed: viewModel.onAddBankAccountTapped,
                    isDisabled: viewModel.isBusy || viewModel.hasError,
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void onViewModelReady(WalletStickyHeaderModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.fetchWallet();
    });
  }

  @override
  WalletStickyHeaderModel viewModelBuilder(BuildContext context) =>
      WalletStickyHeaderModel(onPayoutSuccess: onPayoutSuccess);
}

class _WalletStickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double balance;
  final String currency;
  final String? partiallyVisibleBankAccountNumber;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback? onRetry;

  _WalletStickyHeaderDelegate({
    required this.balance,
    required this.currency,
    required this.partiallyVisibleBankAccountNumber,
    required this.isLoading,
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final shrinkRatio = shrinkOffset / (maxExtent - minExtent);
    bool isShrunk = shrinkRatio > 0.7;
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.only(
        left: AppSpacing.px16,
        right: AppSpacing.px16,
        top: AppSpacing.px8,
      ),
      child: isLoading
          ? BalanceCard.loading(isShrunk: isShrunk)
          : errorMessage != null
          ? BalanceCard.error(
              isShrunk: isShrunk,
              errorMessage: errorMessage!,
              onRetry: onRetry,
            )
          : BalanceCard.success(
              isShrunk: isShrunk,
              balance: balance,
              currency: currency,
              partiallyVisibleBankAccountNumber:
                  partiallyVisibleBankAccountNumber,
            ),
    );
  }

  @override
  double get maxExtent => 164 * AppSpacing.px1;

  @override
  double get minExtent => 53 * AppSpacing.px1;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
