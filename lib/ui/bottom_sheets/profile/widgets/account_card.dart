import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/ui/bottom_sheets/profile/profile_sheet_model.dart';
import 'package:kreyno/ui/bottom_sheets/profile/widgets/profile_settings_list_tile.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';

class AccountCard extends ViewModelWidget<ProfileSheetModel> {
  const AccountCard({super.key});

  @override
  Widget build(BuildContext context, ProfileSheetModel viewModel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(
          top: 2 * AppSpacing.px1,
          bottom: 10 * AppSpacing.px1,
          left: 2 * AppSpacing.px1,
          right: 2 * AppSpacing.px1,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.px12),
          border: Border.all(color: AppColors.strokeKre),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                top: AppSpacing.px20,
                left: AppSpacing.px4,
                right: AppSpacing.px4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10 * AppSpacing.px1),
                border: Border.all(color: AppColors.white),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFF5F5F5),
                    (const Color(0xFFFAFAFA)).withValues(alpha: .0),
                  ],
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 25 * AppSpacing.px1,
                    backgroundImage: CachedNetworkImageProvider(
                      viewModel.currentUser.avatar?.url ??
                          AppConstants.defaultAvatarUrl,
                    ),
                  ),
                  VGap(AppSpacing.px8),
                  CustomText.title(
                    '${viewModel.currentUser.firstName} ${viewModel.currentUser.lastName}',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  VGap(AppSpacing.px4),
                  CustomText.smallParagraphMedium(
                    viewModel.currentUser.phone,
                    color: AppColors.textKre,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  VGap(AppSpacing.px12),
                  CustomButton.outlined(
                    size: CustomButtonSize.small,
                    expandToFullWidth: false,
                    text: ProfileSheetStrings.accountSettings,
                    onPressed: viewModel.onAccountSettingsTapped,
                  ),
                ],
              ),
            ),
            VGap(AppSpacing.px12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10 * AppSpacing.px1),
              child: const CustomDivider(),
            ),
            VGap(AppSpacing.px12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10 * AppSpacing.px1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSpacing.px1 * 10,
                children: [
                  ProfileSettingsListTile(
                    title: ProfileSheetStrings.myVehicles,
                    icon: CustomIcon(
                      iconPath: AppIcons.car,
                      size: AppSpacing.px20,
                    ),
                    iconBgColor: AppColors.greenKre,
                    onTap: viewModel.onMyVehiclesTapped,
                  ),
                  ProfileSettingsListTile(
                    title: ProfileSheetStrings.myParkingSpots,
                    icon: CustomIcon(
                      iconPath: AppIcons.parkingAreaCircle,
                      color: Colors.white,
                      size: AppSpacing.px20,
                    ),
                    iconBgColor: const Color(0xFF0075E2),
                    onTap: viewModel.onMyParkingSpotsTapped,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
