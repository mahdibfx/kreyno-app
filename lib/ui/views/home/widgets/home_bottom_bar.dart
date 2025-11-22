import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/home/home_viewmodel.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({
    super.key,
    this.isButtonDisabled,
    this.onLetMyPlaceButtonPressed,
    required this.avatarUrl,
  });
  final bool? isButtonDisabled;
  final VoidCallback? onLetMyPlaceButtonPressed;
  final String avatarUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSpacing.px20),
          topRight: Radius.circular(AppSpacing.px20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: AppSpacing.px20,
            spreadRadius: 0,
            offset: Offset(0, -5 * AppSpacing.px1),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.px16,
        vertical: AppSpacing.px20,
      ),
      child: SafeArea(
        top: false,
        bottom: Platform.isAndroid,
        child: Row(
          spacing: AppSpacing.px8,
          children: [
            Expanded(
              child: CustomButton.filled(
                isDisabled: isButtonDisabled ?? false,
                size: CustomButtonSize.small,
                text: "home.let_my_place".tr(),
                onPressed: () {
                  if (onLetMyPlaceButtonPressed != null)
                    onLetMyPlaceButtonPressed!();
                  // viewModel.openCreationSpotSheet();
                },
              ),
            ),
            GestureDetector(
              onTap: () async {
                await locator<BottomSheetService>().showCustomSheet(
                  variant: BottomSheetType.profile,
                  barrierColor: Colors.black.withValues(alpha: .1),
                  isScrollControlled: true,
                );
              },
              child: Container(
                width: 10 * AppSpacing.px4,
                height: 10 * AppSpacing.px4,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.strokeKre,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(avatarUrl),
                  ),
                  borderRadius: BorderRadius.circular(AppSpacing.px12),
                  color: AppColors.placeholderKre,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
