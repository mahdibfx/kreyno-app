import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/models/car.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

class MyVehicleCard extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onSetAsPrincipal;
  final Car vehicle;

  const MyVehicleCard({
    super.key,
    required this.vehicle,
    required this.onEdit,
    required this.onDelete,
    required this.onSetAsPrincipal,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacing.px1 * 280,
      child: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          Stack(
            children: [
              Container(
                height: 160 * AppSpacing.px1,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: AppColors.strokeKre.withValues(alpha: .25),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFF5F5F5),
                  image: DecorationImage(
                    image: vehicle.image != null
                        ? CachedNetworkImageProvider(vehicle.image!)
                        : const AssetImage(AppImages.placeholderCarImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (vehicle.isSelected)
                Positioned(
                  top: 10 * AppSpacing.px1,
                  left: 10 * AppSpacing.px1,
                  child: const _PrincipalVehicleBadge(),
                ),
            ],
          ),
          Positioned(
            top: 130 * AppSpacing.px1,
            right: .0,
            left: .0,
            child: Container(
              padding: EdgeInsets.all(AppSpacing.px12),
              margin: EdgeInsets.symmetric(horizontal: 10 * AppSpacing.px1),
              width: double.maxFinite,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: const Color(0xFF0C0C0D).withValues(alpha: .05),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.fromBorderSide(
                  BorderSide(color: AppColors.strokeKre.withValues(alpha: .25)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomText.paragraph(
                          "${vehicle.brand} ${vehicle.model}",
                          maxLines: 2,
                        ),
                      ),
                      GestureDetector(
                        onTapDown: (details) async {
                          await showMenu<int>(
                            color: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppSpacing.px12,
                              ),
                              side: BorderSide(
                                color: AppColors.strokeKre.withValues(
                                  alpha: .25,
                                ),
                              ),
                            ),
                            context: context,
                            position: RelativeRect.fromRect(
                              details.globalPosition & const Size(40.0, 40.0),
                              Offset(AppSpacing.px24, -AppSpacing.px12) &
                                  MediaQuery.of(context).size,
                            ),
                            elevation: .3,
                            items: <PopupMenuEntry<int>>[
                              PopupMenuItem<int>(
                                value: 1,
                                child: IgnorePointer(
                                  ignoring: vehicle.isSelected,
                                  child: Opacity(
                                    opacity: vehicle.isSelected ? .15 : 1.0,
                                    child: Row(
                                      spacing: AppSpacing.px8,
                                      children: [
                                        CustomIcon(
                                          iconPath: AppIcons.crownMinimalistic,
                                          size: AppSpacing.px20,
                                        ),
                                        CustomText.smallParagraphMedium(
                                          MyVehiculesStrings.setAsPrincipal,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              PopupMenuItem<int>(
                                value: 2,
                                child: Row(
                                  spacing: AppSpacing.px8,
                                  children: [
                                    CustomIcon(
                                      iconPath: AppIcons.edit,
                                      size: AppSpacing.px20,
                                    ),
                                    CustomText.smallParagraphMedium(
                                      MyVehiculesStrings.edit,
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem<int>(
                                value: 3,
                                child: IgnorePointer(
                                  ignoring: vehicle.isSelected,
                                  child: Opacity(
                                    opacity: vehicle.isSelected ? .15 : 1.0,
                                    child: Row(
                                      spacing: AppSpacing.px8,
                                      children: [
                                        CustomIcon(
                                          iconPath: AppIcons.delete,
                                          size: AppSpacing.px20,
                                        ),
                                        CustomText.smallParagraphMedium(
                                          MyVehiculesStrings.delete,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ).then((int? result) {
                            if (result != null) {
                              switch (result) {
                                case 1:
                                  if (vehicle.isSelected) return;
                                  onSetAsPrincipal();
                                  break;
                                case 2:
                                  onEdit();
                                  break;
                                case 3:
                                  if (vehicle.isSelected) return;
                                  onDelete();
                                  break;
                              }
                            }
                          });
                        },
                        child: const Icon(Icons.more_horiz_outlined),
                      ),
                    ],
                  ),
                  VGap(AppSpacing.px4),
                  CustomText.smallParagraphMedium(
                    vehicle.registrationNumber,
                    color: AppColors.textKre,
                  ),
                  VGap(AppSpacing.px8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.labelMedium(
                            MyVehiculesStrings.color,
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
                              CustomText.smallParagraphMedium(vehicle.color),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.labelMedium(
                            MyVehiculesStrings.co2Emission,
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
                              CustomText.smallParagraphMedium(
                                "${vehicle.co2Emission} ∼ ${vehicle.co2Emission + 6}",
                              ),
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

class _PrincipalVehicleBadge extends StatelessWidget {
  const _PrincipalVehicleBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5 * AppSpacing.px1,
        vertical: 2.5 * AppSpacing.px1,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFF5D17),
        borderRadius: BorderRadius.circular(6 * AppSpacing.px1),
      ),
      child: Row(
        spacing: 5 * AppSpacing.px1,
        children: [
          CustomIcon(
            iconPath: AppIcons.crownMinimalisticAlt,
            size: AppSpacing.px16,
            color: AppColors.white,
          ),
          CustomText.smallParagraphMedium(
            MyVehiculesStrings.principalVehicle,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}
