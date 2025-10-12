import 'package:flutter/material.dart';
import 'package:kreyno/ui/bottom_sheets/profile/widgets/account_card.dart';
import 'package:kreyno/ui/bottom_sheets/profile/widgets/logout_button.dart';
import 'package:kreyno/ui/bottom_sheets/profile/widgets/profile_list_tile.dart';
import 'package:kreyno/ui/bottom_sheets/profile/widgets/profile_list_tile_list.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'profile_sheet_model.dart';

class ProfileSheet extends StackedView<ProfileSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ProfileSheet({Key? key, required this.completer, required this.request})
    : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileSheetModel viewModel,
    Widget? child,
  ) {
    return BottomSheetLayout(
      spacing: 10 * AppSpacing.px1,
      padding: EdgeInsets.only(
        top: 10 * AppSpacing.px1,
        bottom: AppSpacing.px12,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const AccountCard(),
          VGap(AppSpacing.px8),
          const ProfileListTileList(),
          VGap(AppSpacing.px24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
            child: const LogoutButton(),
          ),
          VGap(AppSpacing.px12),
        ],
      ),
    );
  }

  @override
  ProfileSheetModel viewModelBuilder(BuildContext context) =>
      ProfileSheetModel();
}
