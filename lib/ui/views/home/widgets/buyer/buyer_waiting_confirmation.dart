import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/enums/reservation_status.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/home/home_viewmodel.dart';
import 'package:kreyno/ui/views/home/widgets/buyer/buyer_confirm_arrive.dart';
import 'package:kreyno/ui/views/my_let_place/widgets/smart/received_order_widget.dart';
import 'package:kreyno/ui/views/client_tracking/widgets/tracking_course_widget.dart';
import 'package:kreyno/ui/views/seller_tracking/seller_tracking_viewmodel.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyerWaitingConfirmation
    extends ViewModelWidget<SellerTrackingViewModel> {
  const BuyerWaitingConfirmation({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // const SafeArea(child: CounterBar()),
        const BuyerConfirmArrive(),
        const SizedBox(),
        BottomSheetLayout(
          body: Column(
            children: [
              VGap(AppSpacing.px8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomText(
                      text: viewModel.parkingSpot.address,
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: viewModel.parkingSpot.price.toString(),
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
                ],
              ),
              VGap(AppSpacing.px8),
              Row(
                children: [
                  CustomIcon(
                    iconPath: AppIcons.evCharging,
                    color: viewModel.parkingSpot.electricChargeStation
                        ? AppColors.greenKre
                        : AppColors.textKre,
                  ),
                  HGap(AppSpacing.px4),
                  CustomText(
                    text: viewModel.parkingSpot.electricChargeStation
                        ? "Borne disponible"
                        : "Borne indisponible",
                    style: CustomTextStyle.smallParagraphMedium,
                    color: viewModel.parkingSpot.electricChargeStation
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
              VGap(AppSpacing.px16),
              const CustomDivider(),
              VGap(AppSpacing.px16),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      viewModel.parkingSpot.seller.avatar?.url ??
                          AppConstants.defaultAvatarUrl,
                      fit: BoxFit.cover,
                      width: AppSpacing.px1 * 32,
                      height: AppSpacing.px1 * 32,
                    ),
                  ),
                  HGap(AppSpacing.px8),
                  CustomText.paragraph(viewModel.parkingSpot.seller.username),
                ],
              ),
              VGap(AppSpacing.px12),
              Container(
                padding: EdgeInsets.all(AppSpacing.px8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: const Border.fromBorderSide(
                    BorderSide(color: AppColors.strokeKre),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            viewModel.parkingSpot.seller.car.image?.url ??
                                AppConstants.defaultAvatarUrl,
                            fit: BoxFit.cover,
                            width: AppSpacing.px1 * 48,
                            height: AppSpacing.px1 * 48,
                          ),
                        ),
                        HGap(AppSpacing.px8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.smallParagraphBold(
                              "${viewModel.parkingSpot.seller.car.brand} ${viewModel.parkingSpot.seller.car.model}",
                            ),
                            CustomText.smallParagraphMedium(
                              "${viewModel.parkingSpot.seller.car.registrationNumber} · ${viewModel.parkingSpot.seller.car.color}",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              VGap(AppSpacing.px16),
              if (viewModel.reservation.status == ReservationStatus.pending)
                Row(
                  children: [
                    Expanded(
                      child: CustomButton.filled(
                        text: "Annuler",
                        backgroundColor: AppColors.redKre,
                        foregroundColor: AppColors.white,
                        onPressed: () {
                          locator<BottomSheetService>().showCustomSheet(
                            variant: BottomSheetType.cancelationReasons,
                            data: viewModel.reservation,
                          );
                        },
                      ),
                    ),
                    SizedBox(width: AppSpacing.px8),
                    Expanded(
                      child: CustomButton.filled(
                        text: "Message",
                        onPressed: () async {
                          locator<NavigationService>().navigateToChatView(
                            id: 0,
                            name: viewModel.parkingSpot.seller.username,
                            image:
                                viewModel.parkingSpot.seller.avatar?.url ??
                                AppConstants.defaultAvatarUrl,
                            phone: viewModel.parkingSpot.seller.phone,
                            reservationId: viewModel.reservation.id,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 24),
            ],
          ),
          showDragHandler: true,
        ),
      ],
    );
  }
}
