import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/my_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: "Paramètres du compte"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
        child: Column(
          children: [
            SizedBox(height: AppSpacing.px20),
            GestureDetector(
              onTap: () {
                locator<NavigationService>().navigateToEditProfileView();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: AppSpacing.px1 * 10),
                child: Row(
                  children: [
                    const CustomIcon(iconPath: AppIcons.personalCard),
                    HGap(AppSpacing.px1 * 10),
                    const CustomText.smallParagraphMedium(
                      "Informations personnelles",
                    ),
                    const Expanded(child: SizedBox()),
                    const CustomIcon(iconPath: AppIcons.arrowRight),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                locator<NavigationService>().navigateToChangePhoneNumberView();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: AppSpacing.px1 * 10),
                child: Row(
                  children: [
                    const CustomIcon(iconPath: AppIcons.phone),
                    HGap(AppSpacing.px1 * 10),
                    const CustomText.smallParagraphMedium("Changer mon numéro"),
                    const Expanded(child: SizedBox()),
                    const CustomIcon(iconPath: AppIcons.arrowRight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(BuildContext context) =>
      SettingsViewModel();
}
