import 'dart:async';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:stacked/stacked.dart';

class OtpSheetModel extends BaseViewModel {
  final _authService = locator<AuthService>();

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
    // TODO: Implement the logic to validate the OTP
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
