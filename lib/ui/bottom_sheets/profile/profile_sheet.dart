import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'profile_sheet_model.dart';

class ProfileSheet extends StackedView<ProfileSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ProfileSheet({Key? key, required this.completer, required this.request})
    : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileSheetModel viewModel,
    Widget? child,
  ) {
    return BottomSheetLayout(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: const Border.fromBorderSide(
                BorderSide(color: AppColors.strokeKre),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFF5F5F5),
                        Color.fromARGB(0, 250, 250, 250),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      VGap(AppSpacing.px20),
                      const CircleAvatar(radius: 25),
                      VGap(AppSpacing.px8),
                      const CustomText.title("Olivier Dupons"),
                      VGap(AppSpacing.px4),
                      const CustomText.smallParagraphMedium(
                        "+33 612345678",
                        color: AppColors.textKre,
                      ),
                      VGap(AppSpacing.px12),
                      CustomButton.outlined(
                        expandToFullWidth: false,
                        text: "Modifier mon profile",
                        onPressed: () {
                          locator<NavigationService>()
                              .navigateToEditProfileView();
                        },
                        foregroundColor: AppColors.mainKre,
                      ),
                    ],
                  ),
                ),
                VGap(AppSpacing.px12),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CustomDivider(),
                ),
                VGap(AppSpacing.px12),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.px8),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          locator<NavigationService>()
                              .navigateToMyVehiculesView();
                        },
                        child: const ProfileSettingsListTile(
                          title: "Mes vehicules",
                          icon: CustomIcon(iconPath: AppIcons.car),
                          iconBgColor: AppColors.greenKre,
                        ),
                      ),
                      VGap(AppSpacing.px1 * 10),
                      InkWell(
                        onTap: () {
                          locator<NavigationService>()
                              .navigateToMyStationementsView();
                        },
                        child: const ProfileSettingsListTile(
                          title: "Mes stationnements",
                          icon: CustomIcon(
                            iconPath: AppIcons.parkingAreaCircle,
                            color: Colors.white,
                          ),
                          iconBgColor: Color(0xFF0075E2),
                        ),
                      ),
                    ],
                  ),
                ),
                VGap(AppSpacing.px8),
              ],
            ),
          ),
          VGap(AppSpacing.px8),
          InkWell(
            onTap: () {
              locator<NavigationService>().navigateToKreyonoPortfolioView();
            },
            child: const ProfileListTile(
              icon: AppIcons.wallet,
              title: 'Portefeuille Kreyno',
            ),
          ),
          VGap(AppSpacing.px4),
          InkWell(
            onTap: () {
              locator<NavigationService>().navigateToMyPaymentMethodesView();
            },
            child: const ProfileListTile(
              icon: AppIcons.creditCard,
              title: 'Moyens de paiement',
            ),
          ),
          VGap(AppSpacing.px8),
          const CustomDivider(),
          VGap(AppSpacing.px8),
          const ProfileListTile(
            icon: AppIcons.agreement,
            title: 'Conditions d’utilisation',
          ),
          VGap(AppSpacing.px8),
          const ProfileListTile(
            icon: AppIcons.documentText,
            title: 'Politique de confidentialité',
          ),
          VGap(AppSpacing.px24),
          InkWell(
            onTap: () {
              locator<BottomSheetService>().showCustomSheet(
                variant: BottomSheetType.logoutConfirmation,
              );
            },
            child: Container(
              padding: EdgeInsets.all(AppSpacing.px1 * 10),
              decoration: BoxDecoration(
                color: AppColors.redKre.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const CustomIcon(
                    iconPath: AppIcons.logout,
                    color: AppColors.redKre,
                  ),
                  HGap(AppSpacing.px1 * 10),
                  const CustomText.smallParagraphBold(
                    "Déconnexion",
                    color: AppColors.redKre,
                  ),
                ],
              ),
            ),
          ),
          VGap(AppSpacing.px12),
        ],
      ),
    );
  }

  @override
  ProfileSheetModel viewModelBuilder(BuildContext context) =>
      ProfileSheetModel();
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key, required this.icon, required this.title});
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.px1 * 10),
      child: Row(
        children: [
          CustomIcon(iconPath: icon, size: 20),
          HGap(AppSpacing.px1 * 10),
          CustomText(text: title, style: CustomTextStyle.smallParagraphMedium),
        ],
      ),
    );
  }
}

class ProfileSettingsListTile extends StatelessWidget {
  const ProfileSettingsListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.iconBgColor,
  });
  final String title;
  final CustomIcon icon;
  final Color iconBgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.fromBorderSide(BorderSide(color: AppColors.strokeKre)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(7),
            ),
            child: icon,
          ),
          HGap(AppSpacing.px1 * 10),
          CustomText.smallParagraphMedium(title),
          const Expanded(child: SizedBox()),
          const CustomIcon(
            iconPath: AppIcons.arrowRight,
            color: AppColors.textKre,
          ),
          HGap(AppSpacing.px8),
        ],
      ),
    );
  }
}
