import 'package:flutter/material.dart';
import 'package:kreyno/ui/bottom_sheets/profile/profile_sheet_model.dart';
import 'package:kreyno/ui/bottom_sheets/profile/widgets/profile_list_tile.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';

class ProfileListTileList extends ViewModelWidget<ProfileSheetModel> {
  const ProfileListTileList({super.key});

  @override
  Widget build(BuildContext context, ProfileSheetModel viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
          child: ProfileListTile(
            leadingIconPath: AppIcons.wallet,
            title: ProfileSheetStrings.walletKreyno,
            onTap: () {},
          ),
        ),
        VGap(AppSpacing.px4),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
          child: ProfileListTile(
            leadingIconPath: AppIcons.creditCard,
            title: ProfileSheetStrings.paymentMethods,
            onTap: () {},
          ),
        ),
        VGap(AppSpacing.px8),
        const CustomDivider(),
        VGap(AppSpacing.px8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
          child: ProfileListTile(
            leadingIconPath: AppIcons.agreement,
            title: ProfileSheetStrings.conditionsOfUse,
            onTap: () {},
          ),
        ),
        VGap(AppSpacing.px4),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
          child: ProfileListTile(
            leadingIconPath: AppIcons.documentText,
            title: ProfileSheetStrings.privacyPolicy,
            onTap: () {},
          ),
        ),
        VGap(AppSpacing.px4),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
          child: ProfileListTile.withTrailingIcon(
            leadingIconPath: AppIcons.languageCircle,
            title: ProfileSheetStrings.changeLanguage,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
