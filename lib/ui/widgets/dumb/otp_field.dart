import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_typography.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:pinput/pinput.dart';

class OtpField extends StatelessWidget {
  final Function(String) onComplete;
  final Function(String)? onChanged;
  final String? errorText;
  const OtpField({
    super.key,
    required this.onComplete,
    this.onChanged,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      errorText: errorText,
      defaultPinTheme: PinTheme(
        width: 50 * AppSpacing.px1,
        height: 70 * AppSpacing.px1,
        textStyle: AppTypography.paragraph.copyWith(color: AppColors.greenKre),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(6 * AppSpacing.px1),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 50 * AppSpacing.px1,
        height: 70 * AppSpacing.px1,
        textStyle: AppTypography.paragraph.copyWith(color: AppColors.greenKre),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.greenKre, width: 1),
          borderRadius: BorderRadius.circular(6 * AppSpacing.px1),
        ),
      ),
      submittedPinTheme: PinTheme(
        width: 50 * AppSpacing.px1,
        height: 70 * AppSpacing.px1,
        textStyle: AppTypography.paragraph.copyWith(color: AppColors.greenKre),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.strokeKre, width: 1),
          borderRadius: BorderRadius.circular(6 * AppSpacing.px1),
        ),
      ),
      forceErrorState: errorText != null,
      errorTextStyle: AppTypography.labelMedium.copyWith(
        color: AppColors.redKre,
      ),
      errorPinTheme: PinTheme(
        width: 50 * AppSpacing.px1,
        height: 70 * AppSpacing.px1,
        textStyle: AppTypography.paragraph.copyWith(color: AppColors.redKre),
        decoration: BoxDecoration(
          color: AppColors.redKre.withValues(alpha: .1),
          border: Border.all(
            color: AppColors.redKre.withValues(alpha: .25),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6 * AppSpacing.px1),
        ),
      ),
      length: 6,
      pinputAutovalidateMode: PinputAutovalidateMode.disabled,
      pinAnimationType: PinAnimationType.scale,
      showCursor: true,
      onChanged: onChanged,
      onCompleted: onComplete,
      separatorBuilder: (index) => HGap(5 * AppSpacing.px1),
    );
  }
}
