import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PayoutViewModel extends BaseViewModel {
  final _logger = getLogger('PayoutViewModel');
  final _navigationService = locator<NavigationService>();

  String _amount = '';
  String get amount => _amount;

  void setAmount(String typedAmount) {
    _amount += typedAmount;
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
    _navigationService.back();
  }
}
