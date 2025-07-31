import 'dart:async';
import 'package:stacked/stacked.dart';

class OtpSheetModel extends BaseViewModel {
  Timer? _timer;
  int _remainingTime = 60;

  int get remainingTime => _remainingTime;
  bool get canResendCode => _remainingTime == 0;

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

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
