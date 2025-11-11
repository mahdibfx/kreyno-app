import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

class ParkingSpaceListItem extends StatelessWidget {
  final DateTime date;
  final String address;
  final String imageUrl;
  final bool hasElectricCharging;
  final double price;

  const ParkingSpaceListItem({
    super.key,
    required this.date,
    required this.address,
    required this.imageUrl,
    required this.hasElectricCharging,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.px12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.px12),
        border: Border.fromBorderSide(
          BorderSide(color: AppColors.textKre.withValues(alpha: 0.25)),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppSpacing.px8,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSpacing.px4,
                      horizontal: AppSpacing.px8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(AppSpacing.px8),
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: AppColors.strokeKre.withValues(alpha: 0.25),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomIcon(
                          iconPath: AppIcons.evCharging,
                          color: hasElectricCharging
                              ? AppColors.mainKre
                              : AppColors.textKre,
                          size: AppSpacing.px16,
                        ),
                        HGap(5 * AppSpacing.px1),
                        CustomText.labelMedium(
                          hasElectricCharging
                              ? MyParkingSpotsStrings.chargingAvailable
                              : MyParkingSpotsStrings.chargingNotAvailable,
                          color: hasElectricCharging
                              ? AppColors.mainKre
                              : AppColors.textKre,
                        ),
                      ],
                    ),
                  ),
                  VGap(AppSpacing.px8),
                  CustomText.paragraph(
                    address,
                    maxLines: 3,
                    color: AppColors.mainKre,
                  ),
                  VGap(AppSpacing.px1 * 5),
                  CustomText.smallParagraphMedium(
                    DateFormat('dd-MM-yyyy · HH:mm').format(date),
                    color: AppColors.textKre,
                  ),
                ],
              ),
            ),
            VGap(11 * AppSpacing.px1),
            Container(
              width: 64 * AppSpacing.px1,
              padding: EdgeInsets.all(2 * AppSpacing.px1),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(AppSpacing.px8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: AppSpacing.px4,
                children: [
                  CustomText.labelMedium(
                    MyParkingSpotsStrings.price,
                    color: AppColors.textKre,
                  ),
                  CustomText.smallParagraphBold(
                    "${price.toStringAsFixed(1)}€",
                    color: AppColors.mainKre,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
