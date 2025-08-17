import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

class CarTopBar extends StatelessWidget {
  const CarTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
        padding:
            EdgeInsets.all(AppSpacing.px4).copyWith(right: AppSpacing.px1 * 14),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network("https://picsum.photos/200/300",
                  width: AppSpacing.px1 * 38,
                  height: AppSpacing.px1 * 38,
                  fit: BoxFit.cover),
            ),
            HGap(AppSpacing.px8),
            const Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.labelRegular(
                  "Véhicule choisi",
                  color: AppColors.textKre,
                ),
                CustomText.smallParagraphMedium("Peugeot 308")
              ],
            )),
            InkWell(
                onTap: () {
                  // TODO: Implement refresh functionality
                },
                child: const CustomIcon(iconPath: AppIcons.refresh))
          ],
        ),
      ),
    );
  }
}
