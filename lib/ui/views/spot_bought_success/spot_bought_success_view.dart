import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/home/home_view.dart';
import 'package:kreyno/ui/views/spot_sold_success/spot_sold_success_view.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/rounded_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'spot_bought_success_viewmodel.dart';

class SpotBoughtSuccessView extends StackedView<SpotBoughtSuccessViewModel> {
  const SpotBoughtSuccessView({Key? key, required this.reservation})
    : super(key: key);
  final Reservation reservation;
  @override
  Widget builder(
    BuildContext context,
    SpotBoughtSuccessViewModel viewModel,
    Widget? child,
  ) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.greenKre.withValues(alpha: .2),
          leading: IconButton(
            onPressed: () {
              locator<NavigationService>().clearStackAndShowView(
                const HomeView(),
              );
            },
            icon: const CustomIcon(iconPath: AppIcons.multiplicationSign),
          ),
          title: CustomText.paragraph("spotBoughtSuccess.title".tr()),
        ),
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  VGap(AppSpacing.px16),
                  Image.asset(
                    AppImages.parkingSign,
                    width: AppSpacing.px1 * 128,
                    height: AppSpacing.px1 * 128,
                  ),
                  VGap(AppSpacing.px8),
                  CustomText.largeTitle(
                    "spotBoughtSuccess.arrivedMessage".tr(),
                  ),
                  VGap(AppSpacing.px4),
                  CustomText.smallParagraphMedium(
                    "spotBoughtSuccess.hostMessage".tr(),
                    color: AppColors.textKre,
                  ),
                  VGap(AppSpacing.px24),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
                    padding: EdgeInsets.all(AppSpacing.px12),
                    decoration: const BoxDecoration(color: Color(0xFFFAFAFA)),
                    child: Column(
                      children: [
                        InfoListTile(
                          title: "spotBoughtSuccess.reservationNumber".tr(),
                          value: "#${reservation.id}",
                        ),
                        VGap(AppSpacing.px8),
                        InfoListTile(
                          title: "spotBoughtSuccess.price".tr(),
                          value:
                              "${reservation.parkingPlace.totalPaidPrice.toStringAsFixed(2)}€",
                        ),
                        VGap(AppSpacing.px8),
                        InfoListTile(
                          title: "spotBoughtSuccess.dateTime".tr(),
                          value: DateFormat(
                            "dd-MM-yyyy, HH:mm",
                          ).format(reservation.createdAt),
                        ),
                      ],
                    ),
                  ),
                  VGap(AppSpacing.px16),
                  const CustomDivider(),
                  VGap(AppSpacing.px16),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
                    width: double.infinity,
                    height: AppSpacing.px1 * 196,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: reservation.buyer.car.image == null
                            ? const AssetImage("assets/images/car_default.png")
                            : CachedNetworkImageProvider(
                                reservation.buyer.car.image?.url ?? "",
                              ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (reservation.buyer.car.image == null)
                          const SizedBox(),
                        if (reservation.buyer.car.image != null)
                          Padding(
                            padding: EdgeInsets.all(AppSpacing.px1 * 10),
                            child: RoundedButton(
                              iconPath: AppIcons.arrowExpandSharp,
                              onPressed: () {
                                locator<NavigationService>()
                                    .navigateToExpandVehiculeInfoView(
                                      brand: reservation.buyer.car.brand ?? "",
                                      model: reservation.buyer.car.model ?? "",
                                      image:
                                          reservation.buyer.car.image?.url ??
                                          "",
                                      color: reservation.buyer.car.color ?? "",
                                    );
                              },
                              shape: BoxShape.rectangle,
                            ),
                          ),
                        Container(
                          padding: EdgeInsets.all(AppSpacing.px1 * 10),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withValues(alpha: .2),
                                Colors.black,
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          reservation
                                              .parkingPlace
                                              .seller
                                              .avatar
                                              ?.url ??
                                          AppConstants.defaultAvatarUrl,
                                      width: AppSpacing.px1 * 32,
                                      height: AppSpacing.px1 * 32,
                                    ),
                                  ),
                                  HGap(AppSpacing.px8),
                                  CustomText.paragraph(
                                    reservation.parkingPlace.seller.username,
                                    color: AppColors.white,
                                  ),
                                ],
                              ),
                              VGap(AppSpacing.px4),
                              CustomText.smallParagraphMedium(
                                "${reservation.parkingPlace.seller.car!.brand} ${reservation.parkingPlace.seller.car!.model}",
                                color: AppColors.white,
                              ),
                              CustomText.labelMedium(
                                "${reservation.parkingPlace.seller.car!.registrationNumber} · ${reservation.parkingPlace.seller.car!.color}",
                                color: AppColors.white.withValues(alpha: .7),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  VGap(AppSpacing.px20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomText.smallParagraphMedium(
                          "spotBoughtSuccess.placeLocation".tr(),
                          color: AppColors.textKre,
                        ),
                        VGap(AppSpacing.px1 * 6),
                        CustomText.smallParagraphBold(
                          reservation.parkingPlace.address,
                        ),
                        VGap(AppSpacing.px16),
                        CustomText.smallParagraphMedium(
                          "spotBoughtSuccess.other".tr(),
                          color: AppColors.textKre,
                        ),
                        // VGap(AppSpacing.px1 * 6),
                        // Row(
                        //   children: [
                        //     CustomIcon(
                        //       iconPath: AppIcons.evCharging,
                        //       color:
                        //           reservation.parkingPlace.electricChargeStation
                        //           ? AppColors.greenKre
                        //           : AppColors.textKre,
                        //     ),
                        //     HGap(AppSpacing.px4),
                        //     CustomText(
                        //       text:
                        //           reservation.parkingPlace.electricChargeStation
                        //           ? "myParkingSpots.chargingAvailable".tr()
                        //           : "myParkingSpots.chargingNotAvailable".tr(),
                        //       style: CustomTextStyle.smallParagraphMedium,
                        //       color:
                        //           reservation.parkingPlace.electricChargeStation
                        //           ? AppColors.greenKre
                        //           : AppColors.textKre,
                        //     ),
                        //   ],
                        // ),
                        VGap(AppSpacing.px16),
                        // const PaymentMethodListTile(card: null,),
                        VGap(AppSpacing.px1 * 34),
                        CustomButton.filled(
                          text: "payout.goToHome".tr(),
                          onPressed: () {
                            locator<NavigationService>().clearStackAndShowView(
                              const HomeView(),
                            );
                          },
                        ),
                        VGap(AppSpacing.px20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  SpotBoughtSuccessViewModel viewModelBuilder(BuildContext context) =>
      SpotBoughtSuccessViewModel();
}
