import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/models/parking_spot.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/home/home_viewmodel.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyerSelectedMark extends ViewModelWidget<HomeViewModel> {
  const BuyerSelectedMark({super.key, required this.parkingSpot});
  final ParkingSpot parkingSpot;
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            final result = locator<BottomSheetService>().showCustomSheet(
              variant: BottomSheetType.payForSpot,
              isScrollControlled: true,
              data: parkingSpot,
            );
          },
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
                padding: EdgeInsets.all(AppSpacing.px8 * 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            parkingSpot.seller!.avatar?.url ??
                                AppConstants.defaultAvatarUrl,

                            width: AppSpacing.px1 * 40,
                            height: AppSpacing.px1 * 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        HGap(AppSpacing.px8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.smallParagraphMedium(
                              parkingSpot.seller!.username,
                            ),
                            const CustomText.labelMedium(
                              "propose une place à",
                              color: AppColors.textKre,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                text: viewModel.selectedSpot!.price.toString(),
                                color: AppColors.greenKre,
                                style: CustomTextStyle.title,
                              ),
                              const CustomIcon(
                                iconPath: AppIcons.euro,
                                size: 20,
                                color: AppColors.greenKre,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    VGap(AppSpacing.px8),
                    CustomText.paragraph(
                      parkingSpot.address,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                    ),
                    VGap(AppSpacing.px8),
                    Row(
                      children: [
                        const CustomIcon(
                          iconPath: AppIcons.evCharging,
                          color: AppColors.greenKre,
                        ),
                        HGap(AppSpacing.px4),
                        CustomText(
                          text: viewModel.selectedSpot!.electricChargeStation
                              ? "Borne disponible"
                              : "Borne indisponible",
                          style: CustomTextStyle.smallParagraphMedium,
                          color: viewModel.selectedSpot!.electricChargeStation
                              ? AppColors.greenKre
                              : AppColors.textKre,
                        ),
                        HGap(AppSpacing.px8),
                        Row(
                          children: [
                            const CustomIcon(
                              iconPath: AppIcons.route,
                              color: AppColors.textKre,
                            ),
                            HGap(AppSpacing.px1 * 5),
                            const CustomText(
                              text: "2.5 km",
                              style: CustomTextStyle.smallParagraphMedium,
                              color: AppColors.textKre,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              VGap(AppSpacing.px8 * 2),
              // const HomeBottomBar(),
            ],
          ),
        ),
      ],
    );
  }
}
