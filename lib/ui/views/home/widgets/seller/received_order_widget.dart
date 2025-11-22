import 'package:flutter/material.dart';
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
            viewModel.isRefused = false;
            viewModel.rebuildUi();
          },
          child: const CustomIcon(iconPath: AppIcons.arrowLeft),
        ),
        VGap(AppSpacing.px20),
        const CustomText(
          text: "Pourquoi voulez-vous refuser cette demande?",
          style: CustomTextStyle.largeTitle,
          maxLines: 2,
        ),
        VGap(AppSpacing.px4),
        const CustomText(
          text: "Sélectionnez une raison ci-dessous.",
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
          label: "Autre (a spécifier)",
          value: viewModel.isOtherSelected,
          onChanged: (d) {
            viewModel.isOtherSelected = true;
            viewModel.observation = "";
            viewModel.rebuildUi();
          },
        ),
        VGap(AppSpacing.px8),

        InputField(
          controller: viewModel.otherTextController,
          focusNode: FocusNode(),
          hintText: "Saisissez votre raison d’annulation",
          keyboardType: TextInputType.text,
          maxLines: 4,
        ),
        VGap(AppSpacing.px24),
        CustomButton.filled(
          text: "Valider",
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
        const CustomText(
          text: "Nouvelle demande reçue",
          style: CustomTextStyle.largeTitle,
        ),
        VGap(AppSpacing.px4),
        const CustomText(
          text:
              "Quelqu’un souhaite réserver votre place. `Acceptez ou refusez sa demande.",
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
              image: NetworkImage(
                viewModel.reservation!.buyer.avatar?.url ??
                    "https://picsum.photos/400/300",
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
                          child: Image.network(
                            'https://picsum.photos/40/40',
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
                    const CustomText.smallParagraphMedium(
                      "Renault Clio 5",
                      color: AppColors.white,
                    ),
                    CustomText.labelMedium(
                      "DE-123-JW · Blanche",
                      color: AppColors.white.withValues(alpha: .7),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        VGap(AppSpacing.px1 * 15),
        const CustomText(
          text: "Distance & temps approximatifs pour son arrivée",
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
                  const CustomText(
                    text: "∼2.5 km",
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
                  const CustomText(
                    text: "∼3 minutes",
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
        const CustomText(
          text: "Place",
          style: CustomTextStyle.smallParagraphMedium,
          color: AppColors.textKre,
        ),
        VGap(AppSpacing.px1 * 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomText(
                text: viewModel.reservation!.parkingSpot.address,
                maxLines: 2,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: viewModel.reservation!.parkingSpot.totalPaidPrice
                      .toString(),
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
              text: viewModel.reservation!.parkingSpot.electricChargeStation
                  ? "Borne disponible"
                  : "Borne indisponible",
              style: CustomTextStyle.smallParagraphMedium,
              color: viewModel.reservation!.parkingSpot.electricChargeStation
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
                  text: "Refuser",
                  backgroundColor: AppColors.redKre,
                  foregroundColor: AppColors.white,
                  onPressed: () {
                    // viewModel.sellerClickedRefuseOrder();
                    viewModel.refuseOrder();
                  },
                ),
              ),
              SizedBox(width: AppSpacing.px8),
              Expanded(
                child: CustomButton.filled(
                  text: "Accepter",
                  onPressed: () async {},
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
            const CustomText(
              text: "Temps de réponse restant",
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
