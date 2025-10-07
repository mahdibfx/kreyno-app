import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/auth_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/loading_overlay.dart';
import 'package:stacked/stacked.dart';

import 'set_up_permissions_viewmodel.dart';

class SetUpPermissionsView extends StackedView<SetUpPermissionsViewModel> {
  const SetUpPermissionsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SetUpPermissionsViewModel viewModel,
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
              AuthSliverAppBar.noText(
                onBackPressed: viewModel.goBack,
                onSkipPressed: viewModel.onSkipTapped,
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
                sliver: const SliverToBoxAdapter(child: SizedBox.shrink()),
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
                      children: [
                        CustomButton.filled(
                          text: CommonStrings.continueLabel,
                          onPressed: viewModel.onContinueTapped,
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
  SetUpPermissionsViewModel viewModelBuilder(BuildContext context) =>
      SetUpPermissionsViewModel();
}
