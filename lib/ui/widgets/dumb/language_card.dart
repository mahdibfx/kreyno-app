import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_checkbox.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';

enum LanguageCardType { english, french }

class LanguageCard extends StatelessWidget {
  final LanguageCardType type;
  final bool isSelected;
  final bool isOnDarkBackground;
  final VoidCallback onTap;

  const LanguageCard({
    super.key,
    required this.type,
    required this.isSelected,
    this.isOnDarkBackground = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(14 * AppSpacing.px1),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppSpacing.px12),
          border: Border.all(color: AppColors.strokeKre, width: 1.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              spacing: AppSpacing.px8,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  type == LanguageCardType.english
                      ? AppImages.englishFlag
                      : AppImages.frenchFlag,
                  width: AppSpacing.px20,
                  height: AppSpacing.px20,
                ),
                CustomText.smallParagraphBold(
                  type == LanguageCardType.english ? "English" : "Français",
                  color: isOnDarkBackground
                      ? AppColors.white
                      : AppColors.mainKre,
                ),
              ],
            ),
            CustomCheckbox(isSelected: isSelected),
          ],
        ),
      ),
    );
  }
}
