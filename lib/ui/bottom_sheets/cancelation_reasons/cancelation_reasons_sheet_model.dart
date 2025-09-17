import 'package:stacked/stacked.dart';

class CancelationReasonsSheetModel extends BaseViewModel {
  int selectedReasonId = 0;
  final reasons = {
    0: "J’ai changé mes plans",
    1: "Le/la client(e) prends trop de temps pour arriver",
    2: "Le/la client(e) est trop loin",
    3: "Autre (a spécifier)"
  };

  changeReason(int id) {
    selectedReasonId = id;
    notifyListeners();
  }
}
