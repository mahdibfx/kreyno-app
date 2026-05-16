import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/common/responsive_sizer.dart';
import 'package:kreyno/ui/views/my_payment_methodes/widgets/empty_state.dart';
import 'package:kreyno/ui/widgets/dumb/credit_card.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_loading_indicator.dart';
import 'package:kreyno/ui/widgets/dumb/custom_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/error_state_widget.dart';
import 'package:kreyno/ui/widgets/dumb/loading_overlay.dart';
import 'package:kreyno/ui/widgets/dumb/refresher.dart';
import 'package:stacked/stacked.dart';

import 'my_payment_methodes_viewmodel.dart';

class MyPaymentMethodesView extends StackedView<MyPaymentMethodesViewModel> {
  const MyPaymentMethodesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MyPaymentMethodesViewModel viewModel,
    Widget? child,
  ) {
    return LoadingOverlay(
      isShown: viewModel.actionInProgress,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Refresher(
              enableRefresh: !viewModel.hasError && viewModel.cards.isNotEmpty,
              onRefresh: viewModel.onRefresh,
              child: CustomScrollView(
                slivers: [
                  CustomSliverAppBar.shrunk(
                    title: MyPaymentMethodesStrings.title,
                    onBackPressed: viewModel.goBack,
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(
                      left: AppSpacing.px16,
                      right: AppSpacing.px16,
                      bottom: 4 * AppSpacing.px20,
                      top: AppSpacing.px12,
                    ),
                    sliver: viewModel.isBusy
                        ? SliverToBoxAdapter(
                            child: SizedBox(
                              height: 70.dh,
                              child: Center(
                                child: CustomLoadingIndicator(
                                  size: 64 * AppSpacing.px1,
                                ),
                              ),
                            ),
                          )
                        : viewModel.hasError
                        ? SliverToBoxAdapter(
                            child: SizedBox(
                              height: 70.dh,
                              child: Center(
                                child: ErrorStateWidget(
                                  errorMessage: viewModel.modelError ?? '',
                                  onRetryTapped: viewModel.getAllCards,
                                ),
                              ),
                            ),
                          )
                        : viewModel.cards.isEmpty
                        ? SliverToBoxAdapter(
                            child: SizedBox(
                              height: 70.dh,
                              child: const Center(
                                child: MyPaymentMethodesEmptyStateWidget(),
                              ),
                            ),
                          )
                        : SliverList.builder(
                            itemCount: viewModel.cards.length,
                            itemBuilder: (context, index) {
                              final card = viewModel.cards[index];
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: AppSpacing.px12,
                                ),
                                child: CreditCard.withActions(
                                  card: card,
                                  onDelete: () =>
                                      viewModel.onDeleteCardTapped(card.id),
                                  onSetAsDefault: () =>
                                      viewModel.onSetDefaultCardTapped(card.id),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
            if (!viewModel.hasError && viewModel.cards.isNotEmpty)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: AppColors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.px16,
                    vertical: AppSpacing.px20,
                  ),
                  child: SafeArea(
                    top: false,
                    bottom: Platform.isAndroid,
                    child: CustomButton.filled(
                      text: MyPaymentMethodesStrings.addNewCard,
                      isDisabled: viewModel.isBusy,
                      onPressed: viewModel.onAddNewCardTapped,
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
  void onViewModelReady(MyPaymentMethodesViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.getAllCards();
    });
    super.onViewModelReady(viewModel);
  }

  @override
  MyPaymentMethodesViewModel viewModelBuilder(BuildContext context) =>
      MyPaymentMethodesViewModel();
}
