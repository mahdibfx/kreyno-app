import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isSelected;
  final double? size;
  const CustomCheckbox({super.key, required this.isSelected, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? AppSpacing.px20,
      height: size ?? AppSpacing.px20,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.greenKre : Colors.transparent,
        border: Border.all(
          color: isSelected ? AppColors.greenKre : AppColors.strokeKre,
          width: 1.5,
        ),
        shape: BoxShape.circle,
      ),
      child: AnimatedOpacity(
        opacity: isSelected ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: Center(
          child: Icon(
            Icons.check,
            size: AppSpacing.px12,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
