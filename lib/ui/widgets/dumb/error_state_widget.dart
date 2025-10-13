import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

class ErrorStateWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetryTapped;
  const ErrorStateWidget({
    super.key,
    required this.errorMessage,
    required this.onRetryTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.errorStateIllustration,
          height: 180 * AppSpacing.px1,
          width: 180 * AppSpacing.px1,
        ),
        VGap(AppSpacing.px20),
        CustomText.largeTitle(
          CommonStrings.error,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        VGap(AppSpacing.px4),
        CustomText.smallParagraphMedium(
          errorMessage,
          maxLines: 10,
          textAlign: TextAlign.center,
        ),
        VGap(AppSpacing.px20),
        CustomButton.filled(
          text: CommonStrings.retry,
          onPressed: onRetryTapped,
        ),
      ],
    );
  }
}
