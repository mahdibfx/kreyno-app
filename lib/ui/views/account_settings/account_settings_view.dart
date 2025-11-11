import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_sliver_app_bar.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/loading_overlay.dart';
import 'package:kreyno/ui/widgets/dumb/profile_list_tile.dart';
import 'package:stacked/stacked.dart';

import 'account_settings_viewmodel.dart';

class AccountSettingsView extends StackedView<AccountSettingsViewModel> {
  const AccountSettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AccountSettingsViewModel viewModel,
    Widget? child,
  ) {
    return LoadingOverlay(
      isShown: viewModel.isBusy,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: CustomScrollView(
          slivers: [
            CustomSliverAppBar.shrunk(
              title: AccountSettingsStrings.title,
              onBackPressed: viewModel.goBack,
            ),

            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: AppSpacing.px4,
                  children: [
                    VGap(AppSpacing.px12),
                    ProfileListTile.withTrailingIcon(
                      leadingIconPath: AppIcons.personalCard,
                      title: AccountSettingsStrings.personalInformation,
                      onTap: viewModel.onPersonalInformationTapped,
                    ),
                    ProfileListTile.withTrailingIcon(
                      leadingIconPath: AppIcons.phone,
                      title: AccountSettingsStrings.changePhoneNumber,
                      onTap: viewModel.onChangePhoneNumberTapped,
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
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: AppSpacing.px12,
                    children: [
                      CustomButton.filled(
                        size: CustomButtonSize.small,
                        text: AccountSettingsStrings.deleteAccount,
                        onPressed: viewModel.onDeleteAccountTapped,
                        backgroundColor: AppColors.redKre,
                        foregroundColor: AppColors.white,
                      ),
                      CustomText.labelMedium(
                        '${AccountSettingsStrings.youJoinedKreynoOn} ${viewModel.currentUser.createdAt.toLocal().day.toString().padLeft(2, '0')} - ${viewModel.currentUser.createdAt.toLocal().month.toString().padLeft(2, '0')} - ${viewModel.currentUser.createdAt.toLocal().year}',
                        color: AppColors.textKre,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ],
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
  AccountSettingsViewModel viewModelBuilder(BuildContext context) =>
      AccountSettingsViewModel();
}
