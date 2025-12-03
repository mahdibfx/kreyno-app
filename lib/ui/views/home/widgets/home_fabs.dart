import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/home/home_viewmodel.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:stacked/stacked.dart';

class HomeFabs extends ViewModelWidget<HomeViewModel> {
  const HomeFabs({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: AppSpacing.px8,
        children: [
          HomeFabButton(
            iconPath: AppIcons.refresh,
            isLoading: viewModel.loadingPlaces,
            onTap: () {
              viewModel.getNearbyPlaces();
            },
          ),
          HomeFabButton(
            iconPath: AppIcons.sort,
            onTap: () {
              viewModel.openFilterBottomSheet();
            },
          ),
          HomeFabButton(
            iconPath: AppIcons.gpsOn,
            onTap: () {
              viewModel.goToCurrentLocation();
            },
          ),
        ],
      ),
    );
  }
}

class HomeFabButton extends StatelessWidget {
  final String iconPath;
  final Color color;
  final Function() onTap;
  final bool isLoading;
  const HomeFabButton({
    super.key,
    required this.iconPath,
    required this.onTap,
    this.color = AppColors.mainKre,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 44 * AppSpacing.px1,
        height: 44 * AppSpacing.px1,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.px12),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff0c0c0d0d).withValues(alpha: .05),
              blurRadius: AppSpacing.px4,
              spreadRadius: 0,
              offset: Offset(0, AppSpacing.px1),
            ),
            BoxShadow(
              color: const Color(0xff0c0c0d0d).withValues(alpha: .1),
              blurRadius: AppSpacing.px4,
              spreadRadius: 0,
              offset: Offset(0, AppSpacing.px1),
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? const CupertinoActivityIndicator()
              : CustomIcon(
                  iconPath: iconPath,
                  size: AppSpacing.px20,
                  color: color,
                ),
        ),
      ),
    );
  }
}
