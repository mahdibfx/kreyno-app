import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/my_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'kreyono_portfolio_viewmodel.dart';

class KreyonoPortfolioView extends StackedView<KreyonoPortfolioViewModel> {
  const KreyonoPortfolioView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    KreyonoPortfolioViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: MyAppBar(title: "kreynoWallet.title".tr()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
        child: Column(
          children: [
            VGap(AppSpacing.px12),
            Container(
              padding: EdgeInsets.all(AppSpacing.px12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.fromBorderSide(
                  BorderSide(color: AppColors.textKre.withValues(alpha: 0.25)),
                ),
              ),
              child: Container(
                width: double.infinity,
                height: AppSpacing.px1 * 99,
                padding: EdgeInsets.all(AppSpacing.px16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage(AppImages.bgCard),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.smallParagraphMedium(
                      "kreynoWallet.yourBalance".tr(),
                      color: AppColors.placeholderKre,
                    ),
                    const CustomText.largeTitle("33.25€", color: Colors.white),
                  ],
                ),
              ),
            ),
            VGap(AppSpacing.px12),
            CustomButton.outlined(
              text: "kreynoWallet.withdrawMyMoney".tr(),
              onPressed: () {
                locator<NavigationService>().navigateToCheckoutMoneyView();
              },
              icon: AppIcons.cardReceive,
            ),
            VGap(AppSpacing.px20),
            const CustomDivider(),
            VGap(AppSpacing.px32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "kreynoWallet.earningsHistory".tr()),
                IconButton(
                  onPressed: () {},
                  icon: const CustomIcon(iconPath: AppIcons.sort),
                ),
              ],
            ),
            VGap(AppSpacing.px20),
            CustomText.labelMedium(
              DateFormat('MMMM yyyy').format(DateTime.now()),
              color: AppColors.textKre,
            ),
            VGap(AppSpacing.px8),
            const GainWidget(type: "vente"),
            VGap(AppSpacing.px8),
            const GainWidget(type: "retrait"),
            VGap(AppSpacing.px8),
            const GainWidget(type: "vente"),
          ],
        ),
      ),
    );
  }

  @override
  KreyonoPortfolioViewModel viewModelBuilder(BuildContext context) =>
      KreyonoPortfolioViewModel();
}

class GainWidget extends StatelessWidget {
  const GainWidget({super.key, required this.type});
  final String type;
  // later on type is decided from data backend model , feel free to edit the logic
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.px12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.fromBorderSide(
          BorderSide(color: AppColors.textKre.withValues(alpha: 0.25)),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppSpacing.px12),
            decoration: BoxDecoration(
              color: (type == "vente" ? AppColors.greenKre : AppColors.redKre)
                  .withValues(alpha: .07),
              borderRadius: BorderRadius.circular(6),
            ),
            child: CustomIcon(
              iconPath: type == "vente"
                  ? AppIcons.parking
                  : AppIcons.cardReceive,
              color: (type == "vente" ? AppColors.greenKre : AppColors.redKre),
            ),
          ),
          HGap(AppSpacing.px1 * 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.paragraph(
                  "${type == "vente" ? "portfolio.sale".tr() : "portfolio.withdrawal".tr()} #182771621",
                ),
                const CustomText.smallParagraphMedium(
                  "02-01-2025 · 19:10",
                  color: AppColors.textKre,
                ),
              ],
            ),
          ),
          CustomText.paragraph(
            "2€",
            color: (type == "vente" ? AppColors.greenKre : AppColors.redKre),
          ),
        ],
      ),
    );
  }
}
