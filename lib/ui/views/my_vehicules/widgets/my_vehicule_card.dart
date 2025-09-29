import 'package:flutter/material.dart';
import 'package:kreyno/models/car.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

class MyVehiculeCard extends StatelessWidget {
  MyVehiculeCard({super.key, this.onTapOnMenu, required this.car});
  final Car car;
  Function(String result)? onTapOnMenu;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacing.px1 * 280,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
            height: AppSpacing.px1 * 150,
            decoration: BoxDecoration(
              border: Border.fromBorderSide(
                BorderSide(
                  color: const Color(0xFFA8A8A8).withValues(alpha: .25),
                ),
              ),
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: NetworkImage("https://picsum.photos/600/600"),
                fit: BoxFit.cover,
              ),
            ),
            child: car.isSelected
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF5D17),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              const CustomIcon(
                                size: 16,
                                iconPath: AppIcons.crownMinimalisticAlt,
                                color: Colors.white,
                              ),
                              SizedBox(width: AppSpacing.px4),
                              const CustomText.smallParagraphMedium(
                                "Principale",
                                color: AppColors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : null,
          ),
          Positioned(
            top: AppSpacing.px1 * 130,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.all(AppSpacing.px12),
              margin: EdgeInsets.symmetric(horizontal: AppSpacing.px1 * 34),
              height: AppSpacing.px1 * 130,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: Colors.black.withValues(alpha: .05),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.fromBorderSide(
                  BorderSide(
                    color: const Color(0xFFA8A8A8).withValues(alpha: .25),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.paragraph("${car.brand} ${car.model}"),
                      GestureDetector(
                        onTapDown: (details) {
                          showMenu<String>(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            context: context,
                            position: RelativeRect.fromRect(
                              details.globalPosition &
                                  const Size(
                                    40.0,
                                    40.0,
                                  ), // Position of the menu
                              Offset.zero &
                                  MediaQuery.of(context).size, // Bounding box
                            ),
                            items: <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'p',
                                enabled: !car.isSelected,
                                child: Opacity(
                                  opacity: car.isSelected ? 0.5 : 1,
                                  child: Row(
                                    children: [
                                      const CustomIcon(
                                        iconPath: AppIcons.crownMinimalistic,
                                      ),
                                      HGap(AppSpacing.px8),
                                      const CustomText.smallParagraphMedium(
                                        'Choisir comme principale',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'm',
                                child: Row(
                                  children: [
                                    const CustomIcon(iconPath: AppIcons.edit),
                                    HGap(AppSpacing.px8),
                                    const CustomText.smallParagraphMedium(
                                      'Modifier',
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 's',
                                child: Row(
                                  children: [
                                    const CustomIcon(iconPath: AppIcons.delete),
                                    HGap(AppSpacing.px8),
                                    const CustomText.smallParagraphMedium(
                                      'Supprimer',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ).then((String? result) {
                            if (result != null) {
                              if (onTapOnMenu != null) {
                                onTapOnMenu!(result);
                              }
                            }
                          });
                        },
                        child: const Icon(Icons.more_horiz_outlined),
                      ),
                    ],
                  ),
                  VGap(AppSpacing.px4),
                  const CustomText.smallParagraphMedium(
                    "DD-123-DD",
                    color: AppColors.textKre,
                  ),
                  VGap(AppSpacing.px8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText.labelMedium(
                            "Couleur",
                            color: AppColors.textKre,
                          ),
                          VGap(AppSpacing.px4),
                          Row(
                            children: [
                              CustomIcon(
                                iconPath: AppIcons.colors,
                                size: AppSpacing.px16,
                                color: AppColors.greenKre,
                              ),
                              SizedBox(width: AppSpacing.px4),
                              const CustomText.smallParagraphMedium("Noire"),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText.labelMedium(
                            "Émissions de CO₂ (g/km)",
                            color: AppColors.textKre,
                          ),
                          VGap(AppSpacing.px4),
                          Row(
                            children: [
                              CustomIcon(
                                iconPath: AppIcons.ecoPower,
                                size: AppSpacing.px16,
                                color: AppColors.greenKre,
                              ),
                              SizedBox(width: AppSpacing.px4),
                              const CustomText.smallParagraphMedium("60 ∼ 80"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
