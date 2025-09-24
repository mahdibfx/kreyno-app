import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/enums/otp_sheet_type.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SigninViewModel extends FormViewModel {
  final _logger = getLogger('SigninViewModel');
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _authService = locator<AuthService>();
  final _toastService = locator<ToastService>();

  String _countryCode = '+33';
  String _phoneNumber = '';

  String get countryCode => _countryCode;
  String get phoneNumber => _phoneNumber;
  String get fullPhoneNumber => '${_countryCode.trim()}${_phoneNumber.trim()}';

  void setCountryCode(String countryCode) {
    _countryCode = countryCode;
    rebuildUi();
  }

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    rebuildUi();
  }

  void onPhoneNumberChanged(String countryCode, String phoneNumber) {
    _logger.d('onPhoneNumberChanged: $countryCode, $phoneNumber');
    setCountryCode(countryCode);
    setPhoneNumber(phoneNumber);
  }

  void goBack() {
    _navigationService.back();
  }

  void onCtaTapped() async {
    setBusy(true);
    final response = await _authService.checkIfUserExists(fullPhoneNumber);

    response.match(
      (errorMessage) {
        _logger.e('Error checking if user exists', error: errorMessage);
        setBusy(false);
        _toastService.showError(title: errorMessage, showIcon: true);
      },
      (exists) {
        _checkIfUserExists(exists);
      },
    );
  }

  void _checkIfUserExists(bool exists) async {
    if (exists) {
      _sendOtp();
    } else {
      setBusy(false);
      await _navigationService.navigateToSignupView(
        phoneNumber: (countryCode, phoneNumber),
      );
    }
  }

  void _sendOtp() async {
    final response = await _authService.sendOtp(fullPhoneNumber);
    setBusy(false);
    response.match((errorMessage) {
      _logger.e('Error sending otp', error: errorMessage);
      _toastService.showError(title: errorMessage);
    }, (success) => showOtpSheet());
  }

  void showOtpSheet() async {
    _toastService.showSuccess(
      title: CommonStrings.codeSentTitle,
      description: CommonStrings.codeSentDescription,
      showIcon: true,
    );
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.otp,
      barrierColor: Colors.black.withValues(alpha: .1),
      data: (type: OtpSheetType.signin, phoneNumber: fullPhoneNumber),
      // TODO: barrierDismissible: false,
      isScrollControlled: true,
    );
  }
}
