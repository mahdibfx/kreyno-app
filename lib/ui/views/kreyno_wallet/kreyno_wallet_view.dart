import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/refresher.dart';
import 'package:stacked/stacked.dart';

import 'kreyno_wallet_viewmodel.dart';
import 'widgets/wallet_history_list.dart';
import 'widgets/wallet_sticky_header/wallet_sticky_header.dart';

class KreynoWalletView extends StackedView<KreynoWalletViewModel> {
  const KreynoWalletView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    KreynoWalletViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Refresher(
        onRefresh: viewModel.fetchTransactions,
        child: CustomScrollView(
          slivers: [
            CustomSliverAppBar.shrunk(
              title: WalletStrings.walletKreyno,
              onBackPressed: viewModel.goBack,
            ),
            WalletStickyHeader(
              onPayoutSuccess: (success) {
                if (success) {
                  viewModel.fetchTransactions();
                }
              },
            ),
            const WalletHistoryList(),
          ],
        ),
      ),
    );
  }

  @override
  KreynoWalletViewModel viewModelBuilder(BuildContext context) =>
      KreynoWalletViewModel();

  @override
  void onViewModelReady(KreynoWalletViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.fetchTransactions();
    });
  }
}
