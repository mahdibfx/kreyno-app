import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

class ParkingSpotsEmptyState extends StatelessWidget {
  final String title;
  final String description;

  const ParkingSpotsEmptyState({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.parkingSpotsEmptyStateIllustration,
          height: 180 * AppSpacing.px1,
          width: 180 * AppSpacing.px1,
        ),
        VGap(AppSpacing.px24),
        CustomText.largeTitle(title, maxLines: 2, textAlign: TextAlign.center),
        VGap(AppSpacing.px4),
        CustomText.smallParagraphMedium(
          description,
          maxLines: 10,
          textAlign: TextAlign.center,
          color: AppColors.textKre,
        ),
      ],
    );
  }
}
