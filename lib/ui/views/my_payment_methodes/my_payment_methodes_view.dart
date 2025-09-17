import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/my_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'my_payment_methodes_viewmodel.dart';

class MyPaymentMethodesView extends StackedView<MyPaymentMethodesViewModel> {
  const MyPaymentMethodesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MyPaymentMethodesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.px24, vertical: AppSpacing.px20)
              .copyWith(bottom: AppSpacing.px32),
          child: CustomButton.filled(
              onPressed: () async {
                final result = await locator<BottomSheetService>()
                    .showCustomSheet(
                        variant: BottomSheetType.addPaymentCart,
                        isScrollControlled: true);
              },
              text: "Ajouter une nouvelle carte")),
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: 'Moyens de paiement',
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
            sliver: SliverList.builder(
              itemCount: 20,
              itemBuilder: (context, index) => Column(
                children: [const MyPaymentMethod(), VGap(AppSpacing.px12)],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  MyPaymentMethodesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyPaymentMethodesViewModel();
}

class MyPaymentMethod extends StatelessWidget {
  const MyPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.px8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: const Border.fromBorderSide(
              BorderSide(color: AppColors.strokeKre))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: AppSpacing.px1 * 164,
            padding: EdgeInsets.all(AppSpacing.px16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                    image: AssetImage(AppImages.bgCard), fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImages.visaTextLogo),
                const CustomText.largeTitle(
                  "**** 4355",
                  color: Colors.white,
                )
              ],
            ),
          ),
          VGap(AppSpacing.px16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.smallParagraphBold("Olivier Dupons"),
                    CustomText.labelMedium(
                      "Nom sur la carte",
                      color: AppColors.textKre,
                    )
                  ],
                ),
                VGap(AppSpacing.px16),
                const Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.smallParagraphBold("02/27"),
                          CustomText.labelMedium(
                            "Valide jusqu’au",
                            color: AppColors.textKre,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.smallParagraphBold("***"),
                          CustomText.labelMedium(
                            "CVV",
                            color: AppColors.textKre,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          VGap(AppSpacing.px16),
        ],
      ),
    );
  }
}
