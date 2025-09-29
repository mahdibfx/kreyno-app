import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:kreyno/services/picked_language_service.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _pickedLanguageService = locator<PickedLanguageService>();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // Check if language has been selected using our service
    final languageResult = await _pickedLanguageService.isLanguageSelected();

    final isLanguagePicked = languageResult.fold((error) {
      // If there's an error reading language preference, assume not picked
      return false;
    }, (isSelected) => isSelected);

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
