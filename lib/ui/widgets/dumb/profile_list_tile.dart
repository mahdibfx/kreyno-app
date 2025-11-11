import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';

class ProfileListTile extends StatelessWidget {
  final String leadingIconPath;
  final String? trailingIconPath;
  final String title;
  final VoidCallback onTap;

  const ProfileListTile({
    super.key,
    required this.leadingIconPath,
    required this.title,
    required this.onTap,
  }) : trailingIconPath = null;

  const ProfileListTile.withTrailingIcon({
    super.key,
    required this.leadingIconPath,
    required this.title,
    required this.onTap,
    this.trailingIconPath = AppIcons.arrowRight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 10 * AppSpacing.px1),
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
                  CustomIcon(iconPath: leadingIconPath, size: AppSpacing.px20),
                  Expanded(
                    child: CustomText.smallParagraphMedium(title, maxLines: 2),
                  ),
                ],
              ),
            ),
            if (trailingIconPath != null)
              Padding(
                padding: EdgeInsets.only(
                  left: 2 * AppSpacing.px1,
                  right: 10 * AppSpacing.px1,
                ),
                child: CustomIcon(
                  iconPath: trailingIconPath!,
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
