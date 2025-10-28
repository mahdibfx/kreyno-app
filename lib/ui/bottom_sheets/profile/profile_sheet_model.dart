import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileSheetModel extends ReactiveViewModel {
  final _logger = getLogger('ProfileSheetModel');
  final _userService = locator<UserService>();
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
  }

  void onPrivacyPolicyTapped() async {
    // TODO: Implement privacy policy
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
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_userService];
}
