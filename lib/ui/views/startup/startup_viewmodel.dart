import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final BuildContext context;
  StartupViewModel({required this.context});

  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  Future runStartupLogic() async {
    var isLanguagePicked =
        context.savedLocale != null || context.locale.languageCode == 'fr';
    await Future.delayed(const Duration(seconds: 3));

    if (!isLanguagePicked) {
      await _navigationService.replaceWithSetUpLanguageView();
      return;
    }

    // Check if user is authenticated (has access token)
    final accessToken = await _authService.getAccessToken();
    final isAuthenticated = accessToken != null && accessToken.isNotEmpty;

    if (isAuthenticated) {
      // User is logged in, navigate to home
      await _navigationService.replaceWithHomeView();
    } else {
      // User is not logged in, navigate to onboarding
      await _navigationService.replaceWithOnboardingView();
    }
  }
}
