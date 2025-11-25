import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_stripe/flutter_stripe.dart' hide Card;
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/models/parking_spot.dart';
import 'package:kreyno/ui/bottom_sheets/pay_for_spot/widgets/payment_list_tile.dart';
import 'package:kreyno/ui/bottom_sheets/pay_for_spot/widgets/slideable_button.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/rounded_button.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'pay_for_spot_sheet_model.dart';
import '../../../models/card.dart';

class PayForSpotSheet extends StackedView<PayForSpotSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const PayForSpotSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PayForSpotSheetModel viewModel,
    Widget? child,
  ) {
    print(viewModel.cards.length);
    return BottomSheetLayout(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,

        child: viewModel.paymentSubmitted
            ? PaymentSubmit(key: const Key("submit"), parkingSpot: request.data)
            : InitialPaymentState(
                key: const Key("initial"),
                parkingSpot: request.data,
              ),
      ),
    );
  }

  @override
  void onViewModelReady(PayForSpotSheetModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
    viewModel.getAllCards();
  }

  @override
  PayForSpotSheetModel viewModelBuilder(BuildContext context) =>
      PayForSpotSheetModel();
}

class PaymentSubmit extends ViewModelWidget<PayForSpotSheetModel> {
  const PaymentSubmit({super.key, required this.parkingSpot});
  final ParkingSpot parkingSpot;
  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                viewModel.paymentSubmitted = false;
                viewModel.rebuildUi();
              },
              child: const CustomIcon(iconPath: AppIcons.arrowLeft),
            ),
            const CustomText.paragraph("Paiment"),
            const CustomIcon(iconPath: AppIcons.multiplicationSign),
          ],
        ),
        VGap(AppSpacing.px20),
        const CustomDivider(),
        VGap(AppSpacing.px20),
        const CustomText.labelRegular("Payer avec", color: AppColors.textKre),
        VGap(AppSpacing.px8),
        if (viewModel.cards.isNotEmpty)
          Column(
            children: List.generate(
              viewModel.cards.length,
              (index) => Padding(
                padding: EdgeInsets.only(
                  bottom: index == viewModel.cards.length - 1 ? 0 : 6.0,
                ),
                child: InkWell(
                  onTap: () {
                    viewModel.selectPaymentMethod(viewModel.cards[index]);
                  },
                  child: PaymentMethodListTile(
                    card: viewModel.cards[index],
                    isSelected:
                        viewModel.paymentMethodId == viewModel.cards[index].id,
                  ),
                ),
              ),
            ),
          ),

        if (viewModel.cards.isEmpty)
          const Column(
            children: [
              CustomText.title(
                "Aucun moyen de paiement enregistré",
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              CustomText.smallParagraphMedium(
                "Vous devez ajouter une carte pour payer.",
                color: AppColors.textKre,
              ),
            ],
          ),
        VGap(AppSpacing.px16),
        InkWell(
          onTap: () {
            viewModel.onAddNewCardTapped();
          },
          child: Container(
            padding: EdgeInsets.all(AppSpacing.px1 * 10),
            decoration: BoxDecoration(
              color: viewModel.cards.isEmpty
                  ? AppColors.greenKre
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.textKre.withValues(alpha: .25),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomIcon(iconPath: AppIcons.creditCardAdd),
                HGap(AppSpacing.px8),
                const CustomText.smallParagraphBold(
                  "Ajouter une nouvelle carte",
                ),
              ],
            ),
          ),
        ),
        VGap(AppSpacing.px16),
        const CustomDivider(),
        VGap(AppSpacing.px16),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: const Border.fromBorderSide(
              BorderSide(color: AppColors.strokeKre),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText.smallParagraphMedium(
                    "Stationnement",
                    color: AppColors.textKre,
                  ),
                  CustomText.smallParagraphBold("${parkingSpot.price}€"),
                ],
              ),
              const SizedBox(height: 4),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText.smallParagraphMedium(
                    "Frais Kreyno (20%)",
                    color: AppColors.textKre,
                  ),
                  CustomText.smallParagraphBold(
                    "${parkingSpot.totalPaidPrice - parkingSpot.price}€",
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFF1F1F1),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 7,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText.smallParagraphBold("Total à payer"),
                    CustomText.smallParagraphBold(
                      "${parkingSpot.totalPaidPrice}€",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        VGap(AppSpacing.px16),
        Row(
          children: [
            const CustomIcon(
              iconPath: AppIcons.squareLock,
              color: AppColors.textKre,
            ),
            HGap(AppSpacing.px8),
            const Expanded(
              child: CustomText.smallParagraphMedium(
                "Vos informations de paiement sont entièrement sécurisées et protégées.",
                maxLines: 2,
                color: AppColors.textKre,
              ),
            ),
          ],
        ),
        VGap(AppSpacing.px24),
        CustomButton.filled(
          text: "Payer & réserver cette place",
          isDisabled: viewModel.cards.isEmpty,
          onPressed: () async {
            viewModel.paySubmitted(parkingSpot);
            // final result = await locator<StripeService>().getSetupIntent();
            // result.fold((l) => null, (r) {
            //   locator<StripeService>().initializePaymentSheet(
            //     clientSecret: r.clientSecret,
            //   );
            //   locator<StripeService>().presentPaymentSheet();
            // });
          },
        ),
      ],
    );
  }
}

class InitialPaymentState extends ViewModelWidget<PayForSpotSheetModel> {
  const InitialPaymentState({super.key, required this.parkingSpot});
  final ParkingSpot parkingSpot;

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: CustomText(text: parkingSpot.address, maxLines: 2)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: parkingSpot.price.toString(),
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
              text: parkingSpot.electricChargeStation
                  ? "Borne disponible"
                  : "Borne indisponible",
              style: CustomTextStyle.smallParagraphMedium,
              color: parkingSpot.electricChargeStation
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
        VGap(AppSpacing.px24),
        Container(
          width: double.infinity,
          height: AppSpacing.px1 * 196,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                parkingSpot.seller?.car.image?.url ??
                    AppConstants.defaultAvatarUrl,
              ),
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
                          child: CachedNetworkImage(
                            imageUrl:
                                parkingSpot.seller?.avatar?.url ??
                                AppConstants.defaultAvatarUrl,
                            fit: BoxFit.cover,
                            width: AppSpacing.px1 * 32,
                            height: AppSpacing.px1 * 32,
                          ),
                        ),
                        HGap(AppSpacing.px8),
                        CustomText.paragraph(
                          parkingSpot.seller?.username ?? "",
                          color: AppColors.white,
                        ),
                      ],
                    ),
                    VGap(AppSpacing.px4),
                    CustomText.smallParagraphMedium(
                      parkingSpot.seller?.car.brand ?? "",
                      color: AppColors.white,
                    ),
                    CustomText.labelMedium(
                      parkingSpot.seller?.car.registrationNumber ?? "",
                      color: AppColors.white.withValues(alpha: .7),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        VGap(AppSpacing.px24),
        SlideableButton(
          onCompleted: () {
            print("completed");
            viewModel.goToPaymentPart();
          },
        ),
        // CustomButton.filled(
        //   text: "Passer au paiment",
        //   onPressed: () {},
        // ),
        // VGap(AppSpacing.px24),
      ],
    );
  }
}
