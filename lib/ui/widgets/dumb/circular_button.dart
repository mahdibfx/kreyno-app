import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';

class CircularButton extends StatelessWidget {
  const CircularButton(
      {super.key, required this.iconPath, required this.onPressed});
  final String iconPath;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: CircleAvatar(
        radius: AppSpacing.px16,
        backgroundColor: AppColors.strokeKre,
        child: CustomIcon(
          iconPath: iconPath,
          size: AppSpacing.px20,
        ),
      ),
    );
  }
}
