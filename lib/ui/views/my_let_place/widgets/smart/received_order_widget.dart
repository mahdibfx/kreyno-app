import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/home/home_viewmodel.dart';
import 'package:kreyno/ui/views/my_let_place/my_let_place_view.dart';
import 'package:kreyno/ui/views/my_let_place/my_let_place_viewmodel.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/input_field.dart';
import 'package:kreyno/ui/widgets/dumb/labeled_checkbox.dart';
import 'package:kreyno/ui/widgets/dumb/labeled_radio.dart';
import 'package:kreyno/ui/widgets/dumb/rounded_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ReceivedOrderWidget extends ViewModelWidget<MyLetPlaceViewModel> {
  const ReceivedOrderWidget({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // const CounterBar(),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.px24,
            vertical: AppSpacing.px20,
          ),
          child: AnimatedSwitcher(
            transitionBuilder: (child, animation) {
              return SlideTransition(
                position: animation.drive(
                  Tween<Offset>(begin: const Offset(-2.5, 0), end: Offset.zero),
                ),
                child: child,
              );
            },
            duration: const Duration(milliseconds: 800),
            child: viewModel.isRefused
                ? const RefuseReasonForm(key: ValueKey("refuse-form"))
                : const DemandOrderBody(key: ValueKey("demand-order")),
            //  const DemandOrderBody(key: ValueKey("demand-order")),
          ),
        ),
      ],
    );
  }
}

class RefuseReasonForm extends ViewModelWidget<MyLetPlaceViewModel> {
  const RefuseReasonForm({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VGap(AppSpacing.px20),
        InkWell(
          onTap: () {
            // viewModel.cancelRefuseOrder();
            print("hello world ${viewModel.isRefused}");
            viewModel.isRefused = false;
            print("hello world ${viewModel.isRefused}");

            viewModel.rebuildUi();
            print("hello world ${viewModel.isRefused}");
          },
          child: const CustomIcon(iconPath: AppIcons.arrowLeft),
        ),
        VGap(AppSpacing.px20),
        CustomText(
          text: "receivedOrder.refuseReason".tr(),
          style: CustomTextStyle.largeTitle,
          maxLines: 2,
        ),
        VGap(AppSpacing.px4),
        CustomText(
          text: "receivedOrder.selectReason".tr(),
          style: CustomTextStyle.smallParagraphMedium,
          color: AppColors.textKre,
        ),
        VGap(AppSpacing.px24),
        ...List.generate(
          viewModel.observations.length,
          (index) => Column(
            children: [
              LabeledRadio(
                label: viewModel.observations[index],
                value:
                    !viewModel.isOtherSelected &&
                    viewModel.observation == viewModel.observations[index],
                onChanged: (d) {
                  viewModel.observation = viewModel.observations[index];
                  viewModel.rebuildUi();
                },
              ),
              VGap(AppSpacing.px8),
            ],
          ),
        ),

        LabeledRadio(
          label: "receivedOrder.other".tr(),
          value: viewModel.isOtherSelected,
          onChanged: (d) {
            viewModel.isOtherSelected = true;
            viewModel.observation = "";
            viewModel.rebuildUi();
          },
        ),
        if (viewModel.isOtherSelected) VGap(AppSpacing.px8),

        if (viewModel.isOtherSelected)
          InputField(
            controller: viewModel.otherTextController,
            focusNode: FocusNode(),
            hintText: "receivedOrder.enterReason".tr(),
            keyboardType: TextInputType.text,
            maxLines: 4,
          ),
        VGap(AppSpacing.px24),
        CustomButton.filled(
          text: "receivedOrder.validate".tr(),
          backgroundColor: AppColors.redKre,
          foregroundColor: AppColors.white,
          onPressed: () {
            viewModel.cancelOrder();
          },
        ),
      ],
    );
  }
}

class DemandOrderBody extends ViewModelWidget<MyLetPlaceViewModel> {
  const DemandOrderBody({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VGap(AppSpacing.px4),
        CustomText(
          text: "receivedOrder.newDemand".tr(),
          style: CustomTextStyle.largeTitle,
        ),
        VGap(AppSpacing.px4),
        CustomText(
          text: "receivedOrder.demandDescription".tr(),
          color: AppColors.textKre,
          style: CustomTextStyle.smallParagraphMedium,
          maxLines: 2,
        ),
        VGap(AppSpacing.px20),
        Container(
          width: double.infinity,
          height: AppSpacing.px1 * 196,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: viewModel.reservation!.buyer.car.image?.url != null
                  ? CachedNetworkImageProvider(
                      viewModel.reservation!.buyer.car.image!.url,
                    )
                  : const AssetImage("assets/images/car_default.png"),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (viewModel.reservation!.buyer.car.image == null)
                const SizedBox(),
              if (viewModel.reservation!.buyer.car.image != null)
                Padding(
                  padding: EdgeInsets.all(AppSpacing.px1 * 10),
                  child: RoundedButton(
                    iconPath: AppIcons.arrowExpandSharp,
                    onPressed: () {
                      locator<NavigationService>()
                          .navigateToExpandVehiculeInfoView(
                            brand: viewModel.reservation!.buyer.car.brand ?? "",
                            model: viewModel.reservation!.buyer.car.model ?? "",
                            image:
                                viewModel.reservation!.buyer.car.image?.url ??
                                "",
                            color: viewModel.reservation!.buyer.car.color ?? "",
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
                    colors: [Colors.black.withValues(alpha: .2), Colors.black],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            viewModel.reservation!.buyer.avatar?.url ??
                                AppConstants.defaultAvatarUrl,
                            fit: BoxFit.cover,
                            width: AppSpacing.px1 * 32,
                            height: AppSpacing.px1 * 32,
                          ),
                        ),
                        HGap(AppSpacing.px8),
                        CustomText.paragraph(
                          viewModel.reservation!.buyer.username,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                    VGap(AppSpacing.px4),
                    CustomText.smallParagraphMedium(
                      viewModel.reservation!.buyer.car.model ?? "",
                      color: AppColors.white,
                    ),
                    CustomText.labelMedium(
                      "${viewModel.reservation!.buyer.car.registrationNumber} · ${viewModel.reservation!.buyer.car.color}",
                      color: AppColors.white.withValues(alpha: .7),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        VGap(AppSpacing.px1 * 15),
        CustomText(
          text: "receivedOrder.distanceAndTime".tr(),
          style: CustomTextStyle.smallParagraphMedium,
          color: AppColors.textKre,
        ),
        VGap(AppSpacing.px1 * 6),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  const CustomIcon(iconPath: AppIcons.route),
                  HGap(AppSpacing.px1 * 5),
                  CustomText(
                    text: viewModel.distanceToSpot,
                    style: CustomTextStyle.smallParagraphMedium,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const CustomIcon(iconPath: AppIcons.stopwatch),
                  HGap(AppSpacing.px1 * 5),
                  CustomText(
                    text: viewModel.timeToSpot,
                    style: CustomTextStyle.smallParagraphMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
        VGap(AppSpacing.px16),
        const CustomDivider(),
        VGap(AppSpacing.px16),
        CustomText(
          text: "receivedOrder.place".tr(),
          style: CustomTextStyle.smallParagraphMedium,
          color: AppColors.textKre,
        ),
        VGap(AppSpacing.px1 * 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomText(
                text: viewModel.reservation!.parkingPlace.address,
                maxLines: 2,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: viewModel.reservation!.parkingPlace.price
                      .toStringAsFixed(2),
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
            const CustomIcon(
              iconPath: AppIcons.evCharging,
              color: AppColors.greenKre,
            ),
            HGap(AppSpacing.px4),
            CustomText(
              text: viewModel.reservation!.parkingPlace.electricChargeStation
                  ? "myParkingSpots.chargingAvailable".tr()
                  : "myParkingSpots.chargingNotAvailable".tr(),
              style: CustomTextStyle.smallParagraphMedium,
              color: viewModel.reservation!.parkingPlace.electricChargeStation
                  ? AppColors.greenKre
                  : AppColors.textKre,
            ),
          ],
        ),
        VGap(AppSpacing.px24),
        SafeArea(
          top: false,
          bottom: true,
          child: Row(
            children: [
              Expanded(
                child: CustomButton.filled(
                  text: "receivedOrder.refuse".tr(),
                  backgroundColor: AppColors.redKre,
                  foregroundColor: AppColors.white,
                  onPressed: () {
                    // viewModel.sellerClickedRefuseOrder();
                    viewModel.refuseOrder();
                    viewModel.rebuildUi();
                    viewModel.notifyListeners();
                  },
                ),
              ),
              SizedBox(width: AppSpacing.px8),
              Expanded(
                child: CustomButton.filled(
                  text: "receivedOrder.accept".tr(),
                  onPressed: () async {
                    viewModel.acceptOrder();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CounterBar extends StatelessWidget {
  const CounterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.mainKre,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
        child: Row(
          children: [
            HGap(AppSpacing.px16),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.px12),
              child: const CustomIcon(
                iconPath: AppIcons.lapTimer,
                color: AppColors.white,
              ),
            ),
            HGap(AppSpacing.px8),
            CustomText(
              text: "receivedOrder.responseTimeRemaining".tr(),
              style: CustomTextStyle.smallParagraphMedium,
              color: AppColors.white,
            ),
            const Expanded(child: SizedBox()),
            Container(
              margin: EdgeInsets.all(AppSpacing.px4),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: AppSpacing.px1 * 6,
              ),
              child: const CustomText(text: "59s"),
            ),
          ],
        ),
      ),
    );
  }
}
