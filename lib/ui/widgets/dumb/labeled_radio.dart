import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';

class LabeledRadio extends StatelessWidget {
  final String label;
  final bool value;
  final Function(bool) onChanged;

  const LabeledRadio({
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
                color: value
                    ? AppColors.redKre.withValues(alpha: .05)
                    : AppColors.white,
                border: Border.all(
                  color: value ? AppColors.redKre : AppColors.strokeKre,
                  width: 1.5,
                ),
                shape: BoxShape.circle,
              ),
              child: AnimatedOpacity(
                opacity: value ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: Center(
                    child: CircleAvatar(
                  radius: 3,
                  backgroundColor:
                      value ? AppColors.redKre : Colors.transparent,
                )),
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
