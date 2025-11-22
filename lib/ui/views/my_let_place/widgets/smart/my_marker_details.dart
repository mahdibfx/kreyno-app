import 'package:flutter/material.dart';
import 'package:kreyno/app/app.dialogs.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/home/home_view.dart';
import 'package:kreyno/ui/views/home/home_viewmodel.dart';
import 'package:kreyno/ui/views/home/widgets/home_bottom_bar.dart';
import 'package:kreyno/ui/views/my_let_place/widgets/smart/received_order_widget.dart';
import 'package:kreyno/ui/views/my_let_place/my_let_place_viewmodel.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MyMarkerDetails extends ViewModelWidget<MyLetPlaceViewModel> {
  const MyMarkerDetails({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (viewModel.reservation == null)
          const SafeArea(child: SoldParkingSpotWidget()),
        if (viewModel.reservation == null)
          HomeBottomBar(
            isButtonDisabled: true,
            avatarUrl: viewModel.currentUserAvatarUrl,
          ),
        if (viewModel.reservation != null) const SizedBox(),
        if (viewModel.reservation != null) const ReceivedOrderWidget(),
      ],
    );
  }
}

class SoldParkingSpotWidget extends ViewModelWidget<MyLetPlaceViewModel> {
  const SoldParkingSpotWidget({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.px16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 11 * AppSpacing.px4,
                height: 11 * AppSpacing.px4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(viewModel.currentUserAvatarUrl),
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.red,
                ),
              ),
              HGap(AppSpacing.px8),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Vous",
                    style: CustomTextStyle.smallParagraphMedium,
                  ),
                  CustomText(
                    text: "proposez une place à",
                    style: CustomTextStyle.labelMedium,
                    color: AppColors.textKre,
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: viewModel.parkingSpot!.price.toStringAsFixed(2),
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
          CustomText(
            text: viewModel.parkingSpot!.address,
            style: CustomTextStyle.paragraph,
            textAlign: TextAlign.start,
            maxLines: 2,
          ),
          VGap(AppSpacing.px8),
          Row(
            children: [
              CustomIcon(
                iconPath: AppIcons.evCharging,
                color: viewModel.parkingSpot!.electricChargeStation
                    ? AppColors.greenKre
                    : AppColors.textKre,
              ),
              HGap(AppSpacing.px4),
              CustomText(
                text: viewModel.parkingSpot!.electricChargeStation
                    ? "Borne disponible"
                    : "Borne non disponible",
                style: CustomTextStyle.smallParagraphMedium,
                color: viewModel.parkingSpot!.electricChargeStation
                    ? AppColors.greenKre
                    : AppColors.textKre,
              ),
              const Expanded(child: SizedBox()),
              InkWell(
                onTap: () async {
                  final d = await locator<DialogService>().showCustomDialog(
                    variant: DialogType.destructive,

                    title: "Supprimer cette place",

                    description:
                        "Cette place sera retirée et ne sera plus proposée aux utilisateurs.",
                    mainButtonTitle: "supprimer",
                    secondaryButtonTitle: "Annuler",
                  );
                  if (d != null && d.confirmed) {
                    viewModel.removePlace();
                  }
                },
                child: const CustomIcon(iconPath: AppIcons.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
