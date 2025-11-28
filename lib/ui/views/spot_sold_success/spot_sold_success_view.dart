import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/input_field.dart';
import 'package:kreyno/ui/widgets/dumb/rounded_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'spot_sold_success_viewmodel.dart';

class SpotSoldSuccessView extends StackedView<SpotSoldSuccessViewModel> {
  const SpotSoldSuccessView({Key? key, required this.reservation})
    : super(key: key);
  final Reservation reservation;
  @override
  Widget builder(
    BuildContext context,
    SpotSoldSuccessViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.greenKre.withValues(alpha: .2),
        leading: IconButton(
          onPressed: () {},
          icon: const CustomIcon(iconPath: AppIcons.multiplicationSign),
        ),
        title: const CustomText.paragraph("Cession confirmée !"),
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                VGap(AppSpacing.px16),
                Image.asset(
                  AppImages.parkedCar,
                  width: AppSpacing.px1 * 128,
                  height: AppSpacing.px1 * 128,
                ),
                VGap(AppSpacing.px8),
                const CustomText.largeTitle("Place cédée avec succès!"),
                VGap(AppSpacing.px4),
                const CustomText.smallParagraphMedium(
                  "Vous venez de gagner 2€ en cédant votre place",
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
                        title: 'N° de réservation',
                        value: "#${reservation.id}",
                      ),
                      VGap(AppSpacing.px8),
                      const InfoListTile(title: 'Prix', value: "2€"),
                      VGap(AppSpacing.px8),
                      InfoListTile(
                        title: 'Date et heure',
                        value: DateFormat(
                          "dd-MM-yyyy, HH:mm",
                        ).format(DateTime.now()),
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
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://picsum.photos/400/400"),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(AppSpacing.px1 * 10),
                        child: RoundedButton(
                          iconPath: AppIcons.arrowExpandSharp,
                          onPressed: () {},
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
                                  child: Image.network(
                                    reservation.buyer.avatar?.url ??
                                        AppConstants.defaultAvatarUrl,
                                    width: AppSpacing.px1 * 32,
                                    height: AppSpacing.px1 * 32,
                                  ),
                                ),
                                HGap(AppSpacing.px8),
                                CustomText.paragraph(
                                  reservation.buyer.username,
                                  color: AppColors.white,
                                ),
                              ],
                            ),
                            VGap(AppSpacing.px4),
                            CustomText.smallParagraphMedium(
                              "${reservation.buyer.car.brand} ${reservation.buyer.car.model}",
                              color: AppColors.white,
                            ),
                            CustomText.labelMedium(
                              "${reservation.buyer.car.registrationNumber} · ${reservation.buyer.car.color}",
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
                      const CustomText.smallParagraphMedium(
                        "Emplacement de la place",
                        color: AppColors.textKre,
                      ),
                      VGap(AppSpacing.px1 * 6),
                      CustomText.smallParagraphBold(
                        reservation.parkingPlace.address,
                      ),
                      VGap(AppSpacing.px16),
                      const CustomText.smallParagraphMedium(
                        "Autre",
                        color: AppColors.textKre,
                      ),
                      VGap(AppSpacing.px1 * 6),
                      Row(
                        children: [
                          const CustomIcon(
                            iconPath: AppIcons.evCharging,
                            color: AppColors.greenKre,
                          ),
                          HGap(AppSpacing.px4),
                          CustomText(
                            text: reservation.parkingPlace.electricChargeStation
                                ? "Borne disponible"
                                : "Borne indisponible",
                            style: CustomTextStyle.smallParagraphMedium,
                            color:
                                reservation.parkingPlace.electricChargeStation
                                ? AppColors.greenKre
                                : AppColors.textKre,
                          ),
                        ],
                      ),
                      VGap(AppSpacing.px16),
                      InputField(
                        controller: TextEditingController(),
                        focusNode: FocusNode(),
                        labelText: "Votre portefeuille Kreyno",
                        hintText: "Olivier Dupons",
                        trailingIcon: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText.smallParagraphBold(
                              "+2€",
                              color: AppColors.greenKre,
                            ),
                          ],
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      VGap(AppSpacing.px1 * 34),
                      CustomButton.filled(
                        text: "Retourner vers l’accueil",
                        onPressed: () {
                          locator<NavigationService>().back();
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
    );
  }

  @override
  SpotSoldSuccessViewModel viewModelBuilder(BuildContext context) =>
      SpotSoldSuccessViewModel();
}

class InfoListTile extends StatelessWidget {
  const InfoListTile({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText.smallParagraphMedium(title, color: AppColors.textKre),
        CustomText.smallParagraphBold(value),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.px24,
      ).copyWith(top: MediaQuery.of(context).viewPadding.top),
      child: const Row(children: []),
    );
  }
}
