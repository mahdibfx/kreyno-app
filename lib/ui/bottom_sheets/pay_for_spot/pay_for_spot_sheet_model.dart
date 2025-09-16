import 'package:stacked/stacked.dart';

class PayForSpotSheetModel extends BaseViewModel {
  bool paymentSubmitted = false;
  paySubmitted() {
    paymentSubmitted = true;
    notifyListeners();
  }
}
