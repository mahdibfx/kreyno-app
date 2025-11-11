import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:kreyno/services/wallet_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:string_validator/string_validator.dart';

class PayoutViewModel extends ReactiveViewModel {
  final _logger = getLogger('PayoutViewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _walletService = locator<WalletService>();

  User get currentUser => _userService.currentUser!;

  double _balance = 0.0;
  double get balance => _balance;

  bool get canWithdraw =>
      _balance >= (_amount.isEmpty ? 0.0 : _amount.toDouble());

  double get balanceAfterWithdraw =>
      _balance - (_amount.isEmpty ? 0.0 : _amount.toDouble());

  String _amount = '';
  String get amount => _amount;

  String get formattedAmount {
    if (_amount.isEmpty) return '0.00';

    final parts = _amount.split('.');
    final integerPart = parts[0];
    final decimalPart = parts.length > 1 ? parts[1] : '';

    String formattedInteger = '';
    for (int i = integerPart.length - 1; i >= 0; i--) {
      final index = integerPart.length - 1 - i;
      if (index > 0 && index % 3 == 0) {
        formattedInteger = ',$formattedInteger';
      }
      formattedInteger = integerPart[i] + formattedInteger;
    }

    if (decimalPart.isNotEmpty) {
      return '$formattedInteger.${decimalPart.padRight(2, '0')}';
    }
    return formattedInteger;
  }

  bool get hasDecimal => _amount.contains('.');
  bool get maxAmountLengthReached {
    if (hasDecimal) {
      // If has decimal, check for 7 digits before decimal + 1 decimal point + 2 digits after = 10 total
      final parts = _amount.split('.');
      return parts[0].length >= 7 ||
          (parts.length > 1 && parts[1].length == 2 && parts[1][1] != '0');
    } else {
      // If no decimal, max 7 digits total
      return _amount.length >= 7;
    }
  }

  bool _success = false;
  bool get success => _success;

  void setSuccess(bool success) {
    _success = success;
    rebuildUi();
  }

  void setBalance(double balance) {
    _balance = balance;
    rebuildUi();
  }

  void setAmount(String typedAmount) {
    if (maxAmountLengthReached) return;

    // Handle decimal point
    if (typedAmount == '.') {
      // Only allow decimal point if there's at least 1 digit
      if (_amount.isEmpty) return;
      // Append .00 instead of just .
      _amount += '.00';
      _logger.d('setAmount: $_amount');
      rebuildUi();
      return;
    }

    // Handle numbers after decimal point
    if (hasDecimal) {
      final parts = _amount.split('.');
      final integerPart = parts[0];
      final decimalPart = parts.length > 1 ? parts[1] : '';

      // If decimal part is "00", replace it with the typed number
      if (decimalPart == '00') {
        _amount = '$integerPart.${typedAmount}0';
      } else if (decimalPart.endsWith('0') && decimalPart.length == 2) {
        // Replace the trailing placeholder 0
        _amount = '$integerPart.${decimalPart[0]}$typedAmount';
      } else if (decimalPart.length < 2) {
        // Otherwise, append normally if we haven't reached max decimal places
        _amount += typedAmount;
      } else {
        // Already at max decimal places
        return;
      }
    } else {
      // No decimal point yet, just append
      _amount += typedAmount;
    }

    _logger.d('setAmount: $_amount');
    rebuildUi();
  }

  void deleteLastDigit() {
    if (_amount.isNotEmpty) {
      _amount = _amount.substring(0, _amount.length - 1);
    }
    rebuildUi();
  }

  void deleteAllDigits() {
    _amount = '';
    rebuildUi();
  }

  void goBack() {
    _navigationService.back(result: _success || false);
  }

  void onConfirmTapped() async {
    setError(null);
    setBusy(true);
    try {
      final response = await _walletService.withdraw(_amount.toDouble());
      await response.match(
        (error) async {
          _logger.e('Failed to withdraw: $error');
          setSuccess(false);
          setError(error);
        },
        (wallet) async {
          setBalance(wallet.balance);
          setSuccess(true);
        },
      );
    } finally {
      setBusy(false);
    }
  }

  void onRetryTapped() {
    setError(null);
    setSuccess(false);
  }

  void onGoToHomeTapped() async {
    await _navigationService.clearStackAndShow(Routes.homeView);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_userService];
}
