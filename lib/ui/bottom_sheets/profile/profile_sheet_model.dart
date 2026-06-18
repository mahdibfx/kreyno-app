import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:kreyno/services/onboarding_service.dart';
import 'package:kreyno/services/shared_prefs_service.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:kreyno/ui/views/onboarding/onboarding_view.dart';
import 'package:kreyno/ui/views/signin/signin_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfileSheetModel extends ReactiveViewModel {
  final _logger = getLogger('ProfileSheetModel');
  final _userService = locator<UserService>();
  final _authService = locator<AuthService>();
  final _onBoardingService = locator<OnboardingService>();
  final _sharedPreferences = locator<SharedPrefsService>();
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  User get currentUser => _userService.currentUser!;

  void onAccountSettingsTapped() async {
    await _navigationService.navigateToAccountSettingsView(
      preventDuplicates: false,
    );
  }

  void onMyVehiclesTapped() async {
    await _navigationService.navigateToMyVehiculesView(
      preventDuplicates: false,
    );
  }

  void onMyParkingSpotsTapped() async {
    await _navigationService.navigateToMyParkingSpotsView(
      preventDuplicates: false,
    );
  }

  void onWalletKreynoTapped() async {
    await _navigationService.navigateToKreynoWalletView(
      preventDuplicates: false,
    );
  }

  void onPaymentMethodsTapped() async {
    await _navigationService.navigateToMyPaymentMethodesView(
      preventDuplicates: false,
    );
  }

  void onConditionsOfUseTapped() async {
    // TODO: Implement conditions of use
    launchUrlString('https://kreyno-landing.netlify.app/terms-conditions');
  }

  void onConditionsOfSaleTapped() async {
    // TODO: Implement conditions of use
    launchUrlString('https://kreyno.fr/cgv');
  }

  void onPrivacyPolicyTapped() async {
    // TODO: Implement privacy policy
    launchUrlString('https://kreyno-landing.netlify.app/privacy');
  }

  void onChangeLanguageTapped() async {
    final languageChanged = await _navigationService
        .navigateToChangeLanguageView(preventDuplicates: false);

    if (languageChanged ?? false) {
      rebuildUi();
    }
  }

  void onLogoutTapped() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.logoutConfirmation,
      barrierColor: Colors.black.withValues(alpha: .1),
      isScrollControlled: true,
    );
    if (response != null && response.confirmed == true) {
      // TODO Handle logout
      _authService.clearAccessToken().then((reponse) {
        reponse.match((r) => null, (r) async {
          await _sharedPreferences.deleteAllData();
          // Reset the onboarding step to null so startup routes to onboarding.
          await _onBoardingService.completeOnboarding();
          _navigationService.clearStackAndShowView(const OnboardingView());
          // _navigationService.clearStackAndShowView(const SigninView());
        });
      });
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_userService];
}
