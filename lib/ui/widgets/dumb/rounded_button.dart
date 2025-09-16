import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.iconPath,
    required this.onPressed,
    this.shape = BoxShape.circle,
    this.backgroundColor = AppColors.strokeKre,
  });
  final String iconPath;
  final BoxShape shape;
  final Color backgroundColor;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: shape == BoxShape.circle
          ? CircleAvatar(
              radius: AppSpacing.px16,
              backgroundColor: backgroundColor,
              child: CustomIcon(iconPath: iconPath, size: AppSpacing.px20),
            )
          : Container(
              padding: EdgeInsets.all(AppSpacing.px12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.white,
              ),
              child: CustomIcon(iconPath: iconPath, size: AppSpacing.px20),
            ),
    );
  }
}
