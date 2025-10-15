import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/enums/otp_sheet_type.dart';
import 'package:kreyno/enums/unique_existence_id.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/change_phone_number/change_phone_number_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChangePhoneNumberViewModel extends FormViewModel {
  final _logger = getLogger('ChangePhoneNumberViewModel');
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

  bool _checkingPhoneNumberTaken = false;
  bool get checkingPhoneNumberTaken => _checkingPhoneNumberTaken;

  bool _phoneNumberAllowed = false;
  bool get phoneNumberAllowed => _phoneNumberAllowed;

  Timer? _phoneNumberDebounceTimer;

  void setCheckingPhoneNumberTaken(bool value) {
    if (value == _checkingPhoneNumberTaken) return;
    _checkingPhoneNumberTaken = value;
    rebuildUi();
  }

  void setPhoneNumberAllowed(bool value) {
    if (value == _phoneNumberAllowed) return;
    _phoneNumberAllowed = value;
    rebuildUi();
  }

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
    _handlePhoneNumberChanged(phoneNumber);
  }

  void _handlePhoneNumberChanged(String value) {
    setPhoneNumberAllowed(false);
    _phoneNumberDebounceTimer?.cancel();
    // Only start timer if phone has value and no validation errors
    if (value.isNotEmpty &&
        hasPhoneNumber &&
        !hasPhoneNumberValidationMessage) {
      _phoneNumberDebounceTimer = Timer(const Duration(milliseconds: 500), () {
        _handlePhoneNumberIsTaken();
      });
    }
  }

  void _handlePhoneNumberIsTaken() async {
    setCheckingPhoneNumberTaken(true);
    try {
      var response = await _authService.checkIfUserExists(
        attribute: UniqueExistenceId.phone,
        value: fullPhoneNumber,
      );
      response.match(
        (errorMessage) {
          _logger.e(
            'Error checking if user with phone number exists',
            error: errorMessage,
          );
          _toastService.showError(title: errorMessage, showIcon: true);
        },
        (exists) {
          if (exists) {
            setPhoneNumberValidationMessage(
              ChangePhoneNumberStrings.phoneNumberTaken,
            );
          } else {
            setPhoneNumberAllowed(true);
          }
        },
      );
    } finally {
      setCheckingPhoneNumberTaken(false);
    }
  }

  void goBack() {
    _navigationService.back();
  }

  void onCtaTapped() async {
    setBusy(true);
    try {
      final response = await _authService.sendOtp(fullPhoneNumber);
      await response.match(
        (errorMessage) async {
          _logger.e('Error sending otp', error: errorMessage);
          _toastService.showError(title: errorMessage);
        },
        (success) async {
          await _showOtpSheet();
        },
      );
    } finally {
      setBusy(false);
    }
  }

  Future<void> _showOtpSheet() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.otp,
      barrierColor: Colors.black.withValues(alpha: .1),
      isScrollControlled: true,
      data: [OtpSheetType.updatePhoneNumber, (phoneNumber: fullPhoneNumber)],
    );
    if (response != null && response.confirmed == true) {
      _toastService.showSuccess(
        title: ChangePhoneNumberStrings.phoneNumberUpdatedSuccessfully,
      );
      goBack();
    }
  }

  @override
  void dispose() {
    _phoneNumberDebounceTimer?.cancel();
    super.dispose();
  }
}
