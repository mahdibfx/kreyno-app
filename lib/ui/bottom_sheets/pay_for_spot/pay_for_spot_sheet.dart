import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/spot_sold_success/spot_sold_success_view.dart';
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
    return BottomSheetLayout(
      body: viewModel.paymentSubmitted
          ? const PaymentSubmit()
          : const InitialPaymentState(),
    );
  }

  @override
  PayForSpotSheetModel viewModelBuilder(BuildContext context) =>
      PayForSpotSheetModel();
}

class PaymentSubmit extends ViewModelWidget<PayForSpotSheetModel> {
  const PaymentSubmit({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIcon(iconPath: AppIcons.arrowLeft),
            CustomText.paragraph("Paiment"),
            CustomIcon(iconPath: AppIcons.multiplicationSign),
          ],
        ),
        VGap(AppSpacing.px20),
        const CustomDivider(),
        VGap(AppSpacing.px20),
        const CustomText.labelRegular("Payer avec", color: AppColors.textKre),
        VGap(AppSpacing.px8),
        const PaymentMethodListTile(),
        VGap(AppSpacing.px16),
        InkWell(
          onTap: () {
            locator<BottomSheetService>().showCustomSheet(
              variant: BottomSheetType.addPaymentCart,
              isScrollControlled: true,
            );
          },
          child: Container(
            padding: EdgeInsets.all(AppSpacing.px1 * 10),
            decoration: BoxDecoration(
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
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText.smallParagraphMedium(
              "Montant",
              color: AppColors.textKre,
            ),
            CustomText.paragraph("2.4€", color: AppColors.mainKre),
          ],
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
          onPressed: () {},
        ),
      ],
    );
  }
}

class PaymentMethodListTile extends StatelessWidget {
  const PaymentMethodListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.px1 * 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.textKre.withValues(alpha: .25)),
      ),
      child: Row(
        children: [
          // Image.asset(AppImages.visa),
          HGap(AppSpacing.px12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.labelRegular(
                "OLIVER DUPONS",
                color: AppColors.textKre,
              ),
              CustomText.labelRegular("**** 1234"),
            ],
          ),
          const Expanded(child: SizedBox()),
          CircleAvatar(
            radius: AppSpacing.px8 + 1,
            backgroundColor: AppColors.greenKre,
            child: const Icon(Icons.done, color: Colors.white, size: 14),
          ),
        ],
      ),
    );
  }
}

class InitialPaymentState extends ViewModelWidget<PayForSpotSheetModel> {
  const InitialPaymentState({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomText(
                text: "58-64 Rue de l'Université,\n 75007 Paris, France",
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
        VGap(AppSpacing.px24),
        GestureDetector(
          onTap: () {
            viewModel.paySubmitted();
          },
          child: const SlideableButton(),
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

class SlideableButton extends StatefulWidget {
  const SlideableButton({super.key});

  @override
  State<SlideableButton> createState() => _SlideableButtonState();
}

class _SlideableButtonState extends State<SlideableButton> {
  double width = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.px4),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greenKre,
        borderRadius: BorderRadius.circular(8),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            child: Row(
              children: [
                Draggable(
                  onDraggableCanceled: (velocity, offset) {
                    width = 0;
                    setState(() {});
                  },
                  onDragCompleted: () {
                    print("completed");
                  },
                  onDragUpdate: (details) {
                    setState(() {
                      width = details.localPosition.dx;
                    });
                  },
                  childWhenDragging: Container(
                    clipBehavior: Clip.hardEdge,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: EdgeInsets.all(AppSpacing.px1 * 10),
                    child: Row(
                      children: List.generate(
                        (width / 20).toInt(),
                        (index) => const AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: CustomIcon(
                            iconPath: AppIcons.doubleAltArrowRight,
                            color: AppColors.textKre,
                          ),
                        ),
                      ),
                    ),
                  ),
                  axis: Axis.horizontal,
                  feedback: Opacity(
                    opacity: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: EdgeInsets.all(AppSpacing.px1 * 10),
                      child: const CustomIcon(
                        iconPath: AppIcons.doubleAltArrowRight,
                      ),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: EdgeInsets.all(AppSpacing.px1 * 10),
                    child: const CustomIcon(
                      iconPath: AppIcons.doubleAltArrowRight,
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(milliseconds: 100),
                  child: const CustomText(
                    text: "Passer au paiement",
                    textAlign: TextAlign.start,
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          );
        },
      ),
    );
  }

  double get opacity {
    // normalize width to range [0.0, 1.0]
    // Example: if max width is 300
    double maxWidth = MediaQuery.of(context).size.width - 300;
    return (1 - (width / maxWidth)).clamp(0.0, 1.0);
  }
}
