import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/models/wallet.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/views/payout/widgets/payout_success_state.dart';
import 'package:kreyno/ui/widgets/dumb/loading_overlay.dart';
import 'package:stacked/stacked.dart';

import 'payout_viewmodel.dart';
import 'widgets/payout_default_state.dart';
import 'widgets/payout_failed_state.dart';

class PayoutView extends StackedView<PayoutViewModel> {
  final Wallet wallet;
  const PayoutView({Key? key, required this.wallet}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PayoutViewModel viewModel,
    Widget? child,
  ) {
    return LoadingOverlay(
      isShown: viewModel.isBusy,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          reverse: true,
          transitionBuilder:
              (
                Widget child,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
              ) {
                return SharedAxisTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.scaled,
                  fillColor: AppColors.white,
                  child: child,
                );
              },
          child: viewModel.hasError
              ? const PayoutFailedState()
              : viewModel.success
              ? const PayoutSuccessState()
              : const PayoutDefaultState(),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(PayoutViewModel viewModel) {
    viewModel.setBalance(wallet.balance);
    super.onViewModelReady(viewModel);
  }

  @override
  PayoutViewModel viewModelBuilder(BuildContext context) => PayoutViewModel();
}
