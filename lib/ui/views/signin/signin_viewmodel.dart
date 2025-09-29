import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/enums/otp_sheet_type.dart';
import 'package:kreyno/enums/unique_existence_id.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:kreyno/ui/views/signin/signin_view.form.dart';

class SigninViewModel extends FormViewModel {
  final _logger = getLogger('SigninViewModel');
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _authService = locator<AuthService>();
  final _toastService = locator<ToastService>();

  String _countryCode = 'FR';
  String _countryDialCode = '+33';
  String get countryCode => _countryCode;
  String get countryDialCode => _countryDialCode;
  String get fullPhoneNumber =>
      '${_countryDialCode.trim()}${phoneNumberValue?.trim()}';

  void setCountryCode(String countryCode) {
    _countryCode = countryCode;
    rebuildUi();
  }

  void setCountryDialCode(String countryDialCode) {
    _countryDialCode = countryDialCode;
    rebuildUi();
  }

  void setPhoneNumber(String phoneNumber) {
    phoneNumberValue = phoneNumber;
    rebuildUi();
  }

  void onPhoneNumberChanged({
    required String countryCode,
    required String countryDialCode,
    required String phoneNumber,
  }) {
    _logger.d(
      'onPhoneNumberChanged: $countryCode, $countryDialCode, $phoneNumber',
    );
    setCountryCode(countryCode);
    setCountryDialCode(countryDialCode);
    setPhoneNumber(phoneNumber);
  }

  void goBack() {
    _navigationService.back();
  }

  void onCtaTapped() async {
    setBusy(true);
    final response = await _authService.checkIfUserExists(
      attribute: UniqueExistenceId.phone,
      value: fullPhoneNumber,
    );

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
        phoneNumber: (
          countryCode: countryCode,
          countryDialCode: countryDialCode,
          phoneNumber: phoneNumberValue!,
        ),
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
    // TODO : uncomment this in case it was wanted
    // _toastService.showSuccess(
    //   title: CommonStrings.codeSentTitle,
    //   description: CommonStrings.codeSentDescription,
    //   showIcon: true,
    // );
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.otp,
      barrierColor: Colors.black.withValues(alpha: .1),
      data: [OtpSheetType.signin, (phoneNumber: fullPhoneNumber)],
      // TODO: barrierDismissible: false,
      isScrollControlled: true,
    );
  }
}
