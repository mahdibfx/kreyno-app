import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';

class LabeledCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final Function(bool) onChanged;

  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        color: Colors.transparent,
        child: Row(
          spacing: 10 * AppSpacing.px1,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 17 * AppSpacing.px1,
              height: 17 * AppSpacing.px1,
              decoration: BoxDecoration(
                color: value ? AppColors.greenKre : AppColors.white,
                border: Border.all(
                  color: value ? AppColors.greenKre : AppColors.strokeKre,
                  width: 1.5,
                ),
                shape: BoxShape.circle,
              ),
              child: AnimatedOpacity(
                opacity: value ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: Center(
                  child: Icon(
                    Icons.check,
                    size: AppSpacing.px12,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: CustomText.smallParagraphMedium(
                label,
                color: AppColors.mainKre,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
