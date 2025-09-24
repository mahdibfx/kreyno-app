import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/my_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../models/card.dart' as api;
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
      appBar: MyAppBar(title: 'Moyens de paiement'),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
            sliver: SliverList.builder(
              itemCount: viewModel.myCards.length,
              itemBuilder: (context, index) => Column(
                children: [
                  MyPaymentMethod(
                    card: viewModel.myCards[index],
                    onTapOnMenu: (d) =>
                        viewModel.onMenuPressed(d, viewModel.myCards[index]),
                  ),
                  VGap(AppSpacing.px12)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onViewModelReady(MyPaymentMethodesViewModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
    viewModel.getMyCards();
  }

  @override
  MyPaymentMethodesViewModel viewModelBuilder(BuildContext context) =>
      MyPaymentMethodesViewModel();
}

class MyPaymentMethod extends StatelessWidget {
  MyPaymentMethod({super.key, required this.card, this.onTapOnMenu});
  final api.Card card;
  Function(String result)? onTapOnMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.px8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: const Border.fromBorderSide(
          BorderSide(color: AppColors.strokeKre),
        ),
      ),
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
                image: AssetImage(AppImages.bgCard),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImages.visaTextLogo),
                CustomText.largeTitle("**** ${card.last4}",
                    color: Colors.white),
              ],
            ),
          ),
          VGap(AppSpacing.px16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.px16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText.smallParagraphBold(
                            "Olivier Dupons"), //TODO:there is nothing from backend like this
                        GestureDetector(
                            onTapDown: (details) {
                              showMenu<String>(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                context: context,
                                position: RelativeRect.fromRect(
                                  details.globalPosition &
                                      const Size(
                                          40.0, 40.0), // Position of the menu
                                  Offset.zero &
                                      MediaQuery.of(context)
                                          .size, // Bounding box
                                ),
                                items: <PopupMenuEntry<String>>[
                                  PopupMenuItem<String>(
                                    value: 'p',
                                    // enabled: card.isSelected, //TODO this should be edited from backend ( now there is no flag )
                                    child: Opacity(
                                      opacity: 1,
                                      // opacity: card.isSelected ? 0.5 : 1, TODO:// Update it when backend updated
                                      child: Row(
                                        children: [
                                          const CustomIcon(
                                              iconPath:
                                                  AppIcons.crownMinimalistic),
                                          HGap(AppSpacing.px8),
                                          const CustomText.smallParagraphMedium(
                                              'Choisir comme principale'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 's',
                                    child: Row(
                                      children: [
                                        const CustomIcon(
                                            iconPath: AppIcons.delete),
                                        HGap(AppSpacing.px8),
                                        const CustomText.smallParagraphMedium(
                                            'Supprimer'),
                                      ],
                                    ),
                                  ),
                                ],
                              ).then((String? result) {
                                if (result != null) {
                                  if (onTapOnMenu != null) {
                                    onTapOnMenu!(result);
                                  }
                                }
                              });
                            },
                            child: const Icon(Icons.more_horiz_outlined))
                      ],
                    ),
                    const CustomText.labelMedium(
                      "Nom sur la carte",
                      color: AppColors.textKre,
                    ),
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
                          ),
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
                          ),
                        ],
                      ),
                    ),
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
