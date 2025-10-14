import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AccountSettingsViewModel extends ReactiveViewModel {
  final _logger = getLogger('AccountSettingsViewModel');
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();

  User get currentUser => _userService.currentUser!;

  void goBack() {
    _navigationService.back();
  }

  void onDeleteAccountTapped() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.deleteAccountConfirmation,
      barrierColor: Colors.black.withValues(alpha: .1),
      isScrollControlled: true,
    );
    if (response != null && response.confirmed == true) {
      // TODO Handle delete account
    }
  }

  void onPersonalInformationTapped() async {
    // TODO: Implement personal information
  }

  void onChangePhoneNumberTapped() async {
    await _navigationService.navigateToChangePhoneNumberView();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_userService];
}
