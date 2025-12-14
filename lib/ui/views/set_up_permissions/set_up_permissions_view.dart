import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/set_up_permissions/widgets/permission_item.dart';
import 'package:kreyno/ui/widgets/dumb/auth_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/loading_overlay.dart';
import 'package:stacked/stacked.dart';

import 'set_up_permissions_viewmodel.dart';

// TODO: Add a lifecycle manager to handle the app lifecycle state change
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
              // AuthSliverAppBar.noText(
              //   onBackPressed: viewModel.goBack,
              //   onSkipPressed: viewModel.onSkipTapped,
              // ),
              SliverPadding(
                padding: EdgeInsets.only(
                  right: AppSpacing.px16,
                  left: AppSpacing.px16,
                  top: AppSpacing.px12,
                ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.permissionsIllustration,
                        width: 170 * AppSpacing.px1,
                        height: 170 * AppSpacing.px1,
                      ),
                      VGap(AppSpacing.px16),
                      CustomText.largeTitle(
                        SetUpPermissionsStrings.title,
                        color: AppColors.mainKre,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                      ),
                      VGap(AppSpacing.px4),
                      CustomText.smallParagraphMedium(
                        SetUpPermissionsStrings.description,
                        color: AppColors.textKre,
                        textAlign: TextAlign.center,
                        maxLines: 4,
                      ),
                      VGap(AppSpacing.px32),
                      PermissionItem(
                        type: PermissionItemType.location,
                        isGranted: viewModel.isLocationGranted,
                        onAuthorizeTapped: viewModel.onLocationAuthorizeTapped,
                      ),
                      VGap(AppSpacing.px16),
                      PermissionItem(
                        type: PermissionItemType.notification,
                        isGranted: viewModel.isNotificationGranted,
                        onAuthorizeTapped:
                            viewModel.onNotificationAuthorizeTapped,
                      ),
                    ],
                  ),
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
                      children: [
                        CustomButton.filled(
                          text: CommonStrings.complete,
                          onPressed: viewModel.onContinueTapped,
                          isDisabled: false ?? !viewModel.allPermissionsGranted,
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
  void onViewModelReady(SetUpPermissionsViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.initializePermissions();
    });
  }

  @override
  SetUpPermissionsViewModel viewModelBuilder(BuildContext context) =>
      SetUpPermissionsViewModel();
}
