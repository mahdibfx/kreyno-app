import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/enums/reservation_status.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/seller_tracking/seller_tracking_viewmodel.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyerConfirmArrive extends ViewModelWidget<SellerTrackingViewModel> {
  const BuyerConfirmArrive({super.key});

  @override
  Widget build(BuildContext context, SellerTrackingViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SafeArea(
          child: Column(
            children: [
              if (viewModel.reservation.status == ReservationStatus.confirmed)
                _statusBar(viewModel),
              VGap(AppSpacing.px12),
              if (viewModel.nearParkingSpotLocation && !viewModel.isArrived)
                _confirmArrivalWindow(viewModel),
              if (viewModel.isArrived) _arrivalConfirmed(viewModel),
            ],
          ),
        ),
      ],
    );
  }

  Container _statusBar(SellerTrackingViewModel viewModel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: AppSpacing.px12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.white,
              ),
              child: CustomText.smallParagraphMedium(
                viewModel.nearParkingSpotLocation
                    ? "buyerConfirmArrive.arrivedAtDestination".tr()
                    : "buyerConfirmArrive.itineraryReady".tr(),
              ),
            ),
          ),
          HGap(AppSpacing.px8),
          GestureDetector(
            onTap: () {
              locator<NavigationService>().navigateToChatView(
                id: 0,
                name: viewModel.reservation.parkingPlace.seller.username,
                image:
                    viewModel.reservation.parkingPlace.seller.avatar?.url ??
                    AppConstants.defaultAvatarUrl,
                phone: viewModel.reservation.parkingPlace.seller.phone,
                reservationId: viewModel.reservation.id,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.white,
              ),
              padding: EdgeInsets.all(AppSpacing.px8),
              child: SvgPicture.asset(AppIcons.chatRoundDots),
            ),
          ),
        ],
      ),
    );
  }

  Container _arrivalConfirmed(SellerTrackingViewModel viewModel) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.px12,
        vertical: AppSpacing.px12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.greenKre.withValues(alpha: .3),
            ),
            padding: EdgeInsets.all(AppSpacing.px8),
            child: SvgPicture.asset(AppIcons.flag, color: AppColors.greenKre),
          ),
          HGap(AppSpacing.px8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.smallParagraphBold(
                  "buyerConfirmArrive.arrivalConfirmed".tr(),
                ),
                SizedBox(
                  child: CustomText.smallParagraphMedium(
                    "buyerConfirmArrive.hostInformed".tr(),
                    maxLines: 2,
                    color: AppColors.textKre,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _confirmArrivalWindow(SellerTrackingViewModel viewModel) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.px12,
        vertical: AppSpacing.px12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.largeTitle("buyerConfirmArrive.confirmArrival".tr()),
          Row(
            children: [
              Expanded(
                child: CustomText.smallParagraphMedium(
                  "buyerConfirmArrive.confirmArrivalDescription".tr(),
                  maxLines: 2,
                  color: AppColors.textKre,
                ),
              ),
            ],
          ),
          VGap(AppSpacing.px16),
          CustomButton.filled(
            text: "buyerConfirmArrive.confirmMyArrival".tr(),
            onPressed: () {
              viewModel.confirmMonArrival();
            },
          ),
        ],
      ),
    );
  }
}
