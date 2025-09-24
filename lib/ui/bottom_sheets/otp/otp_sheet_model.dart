import 'dart:async';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../enums/otp_sheet_type.dart';

class OtpSheetModel extends BaseViewModel {
  final _logger = getLogger('OtpSheetModel');
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _toastService = locator<ToastService>();

  final OtpSheetType type;
  final String phoneNumber;

  OtpSheetModel({required this.type, required this.phoneNumber});

  Timer? _timer;
  int _remainingTime = 60;

  int get remainingTime => _remainingTime;
  bool get canResendCode => _remainingTime == 0;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    rebuildUi();
  }

  void startTimer() {
    _remainingTime = 60;
    rebuildUi();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
        rebuildUi();
      } else {
        _timer?.cancel();
      }
    });
  }

  void resendCode() {
    if (canResendCode) {
      // TODO: Implement the logic to resend the code OTP
      startTimer();
    }
  }

  void onOtpCompleted(String otp) {
    setBusy(true);
    switch (type) {
      case OtpSheetType.signin:
        _handleLogin(otp);
        break;
      case OtpSheetType.signup:
        _handleRegister(otp);
        break;
      case OtpSheetType.updatePhoneNumber:
        _handleUpdatePhoneNumber(otp);
        break;
    }
    setBusy(false);
  }

  void _handleLogin(String otp) async {
    final response = await _authService.login(phone: phoneNumber, otp: otp);
    response.match(
      (error) {
        _logger.e('Error logging in', error: error);
        setErrorMessage(error);
      },
      (authResponse) async {
        final setUserResult = await _authService.setAuthenticatedUser(
          authResponse,
        );
        setUserResult.match(
          (error) {
            _logger.e('Error setting authenticated user', error: error);
          },
          (_) async {
            await _navigationService.clearStackAndShow(Routes.homeView);
          },
        );
      },
    );
  }

  //TODO: when i get to the register section
  void _handleRegister(String otp) {}

  //TODO: when i get to the profile section
  void _handleUpdatePhoneNumber(String otp) {}

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
