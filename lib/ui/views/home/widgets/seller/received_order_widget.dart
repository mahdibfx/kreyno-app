import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_typography.dart';
import 'package:kreyno/ui/views/home/home_viewmodel.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/labeled_checkbox.dart';
import 'package:kreyno/ui/widgets/dumb/labeled_radio.dart';
import 'package:kreyno/ui/widgets/dumb/rounded_button.dart';
import 'package:stacked/stacked.dart';

class ReceivedOrderWidget extends ViewModelWidget<HomeViewModel> {
  const ReceivedOrderWidget({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CounterBar(),
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
            child: viewModel.showRefuseReasonForm
                ? const RefuseReasonForm(key: ValueKey("refuse-form"))
                : const DemandOrderBody(key: ValueKey("demand-order")),
          ),
        ),
      ],
    );
  }
}

class RefuseReasonForm extends ViewModelWidget<HomeViewModel> {
  const RefuseReasonForm({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      VGap(AppSpacing.px20),
      InkWell(
          onTap: () {
            viewModel.cancelRefuseOrder();
          },
          child: const CustomIcon(iconPath: AppIcons.arrowLeft)),
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
      ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: viewModel.reasons.length,
        separatorBuilder: (context, index) => VGap(AppSpacing.px8),
        itemBuilder: (context, index) {
          return LabeledRadio(
            label: viewModel.reasons[index]!,
            value: viewModel.selectedReasonId == index,
            onChanged: (d) {
              viewModel.changeReason(index);
            },
          );
        },
      ),
      VGap(AppSpacing.px8),
      // InputField( controller: , focusNode: focusNode, labelText: labelText, hintText: hintText, keyboardType: keyboardType)

      if (viewModel.selectedReasonId == 3)
        TextFormField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: "Saisissez votre raison d’annulation",
            hintStyle: AppTypography.smallParagraphMedium.copyWith(
              color: AppColors.placeholderKre,
            ),
            errorStyle: AppTypography.labelRegular.copyWith(
              color: AppColors.redKre,
            ),
            filled: true,
            fillColor: AppColors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSpacing.px16,
              vertical: AppSpacing.px12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.px12),
              borderSide: const BorderSide(
                color: AppColors.strokeKre,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.px12),
              borderSide: const BorderSide(
                color: AppColors.strokeKre,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.px12),
              borderSide: const BorderSide(
                color: AppColors.greenKre,
                width: 1.2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.px12),
              borderSide: const BorderSide(
                color: AppColors.redKre,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.px12),
              borderSide: const BorderSide(
                color: AppColors.redKre,
                width: 1.2,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.px12),
              borderSide: const BorderSide(
                color: AppColors.strokeKre,
                width: 1.0,
              ),
            ),
            counterText: '',
          ),
        ),
      VGap(AppSpacing.px24),
      CustomButton.filled(
        text: "Valider",
        backgroundColor: AppColors.redKre,
        foregroundColor: AppColors.white,
        onPressed: () {},
      )
    ]);
  }
}

class DemandOrderBody extends ViewModelWidget<HomeViewModel> {
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
                        const CustomText.paragraph(
                          "sarah.dupons92",
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
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomText(
                text: "58-64 Rue de l'Université, 75007 Paris, France",
                maxLines: 2,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: "2",
                  color: AppColors.greenKre,
                  style: CustomTextStyle.title,
                ),
                CustomIcon(
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
            const CustomText(
              text: "Borne disponible",
              style: CustomTextStyle.smallParagraphMedium,
              color: AppColors.greenKre,
            ),
          ],
        ),
        VGap(AppSpacing.px24),
        Row(
          children: [
            Expanded(
              child: CustomButton.filled(
                text: "Refuser",
                backgroundColor: AppColors.redKre,
                foregroundColor: AppColors.white,
                onPressed: () {
                  viewModel.sellerClickedRefuseOrder();
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
