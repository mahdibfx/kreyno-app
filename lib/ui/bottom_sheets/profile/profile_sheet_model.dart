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
    // TODO: Implement my vehicles
  }

  void onMyParkingSpotsTapped() async {
    // TODO: Implement my parking spots
  }

  void onWalletKreynoTapped() async {
    // TODO: Implement wallet kreyno
  }

  void onPaymentMethodsTapped() async {
    // TODO: Implement payment methods
  }

  void onConditionsOfUseTapped() async {
    // TODO: Implement conditions of use
  }

  void onPrivacyPolicyTapped() async {
    // TODO: Implement privacy policy
  }

  void onChangeLanguageTapped() async {
    // TODO: Implement change language
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
