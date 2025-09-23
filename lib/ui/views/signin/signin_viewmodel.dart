import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SigninViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _authService = locator<AuthService>();

  String _countryCode = '+33';
  String _phoneNumber = '';

  String get countryCode => _countryCode;
  String get phoneNumber => _phoneNumber;
  String get fullPhoneNumber => '$_countryCode$_phoneNumber';

  void setCountryCode(String countryCode) {
    _countryCode = countryCode;
    rebuildUi();
  }

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    rebuildUi();
  }

  void onPhoneNumberChanged(String countryCode, String phoneNumber) {
    setCountryCode(countryCode);
    setPhoneNumber(phoneNumber);
  }

  void goBack() {
    _navigationService.back();
  }

  void onCtaTapped() async {
    // check if user with phone number exists or not to know where to navigate to :
    // if exists, navigate to otp sheet
    // if not exists, navigate to signup view
  }

  void showOtpSheet() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.otp,
      barrierColor: Colors.black.withValues(alpha: .1),
      data: (fullPhoneNumber,),
      isScrollControlled: true,
    );

    if (response != null && response.confirmed) {
      // FIXME: This is a temporary navigation to signup view
      _navigationService.navigateToSignupView(
        phoneNumber: (_countryCode, _phoneNumber),
      );
    }
  }
}
