import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';

class ProfileSettingsListTile extends StatelessWidget {
  final String title;
  final CustomIcon icon;
  final Color iconBgColor;
  final VoidCallback onTap;

  const ProfileSettingsListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.iconBgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          top: 5 * AppSpacing.px1,
          bottom: 5 * AppSpacing.px1,
          left: 5 * AppSpacing.px1,
          right: 2 * AppSpacing.px1,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(AppSpacing.px12)),
          border: Border.all(color: AppColors.strokeKre),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 10 * AppSpacing.px1,
                children: [
                  Container(
                    height: 30 * AppSpacing.px1,
                    width: 30 * AppSpacing.px1,
                    decoration: BoxDecoration(
                      color: iconBgColor,
                      borderRadius: BorderRadius.circular(7 * AppSpacing.px1),
                    ),
                    child: Center(child: icon),
                  ),
                  Expanded(
                    child: CustomText.smallParagraphMedium(title, maxLines: 2),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 2 * AppSpacing.px1,
                right: 10 * AppSpacing.px1,
              ),
              child: CustomIcon(
                iconPath: AppIcons.arrowRight,
                color: AppColors.mainKre.withValues(alpha: .4),
                size: AppSpacing.px20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
