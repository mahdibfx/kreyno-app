import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/views/startup/startup_view.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'error_viewmodel.dart';

class ErrorView extends StackedView<ErrorViewModel> {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ErrorViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/no_internet.png",
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 20),
            const CustomText.largeTitle("Connexion perdue"),
            const SizedBox(height: 4),
            const CustomText.smallParagraphMedium(
              "Vous êtes hors ligne. Vérifiez votre connexion internet pour continuer à utiliser Kreyno.",
              color: AppColors.textKre,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            const SizedBox(height: 20),
            CustomButton.filled(
              text: "Réessayer",
              onPressed: () {
                locator<NavigationService>().clearStackAndShowView(
                  const StartupView(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  ErrorViewModel viewModelBuilder(BuildContext context) => ErrorViewModel();
}
