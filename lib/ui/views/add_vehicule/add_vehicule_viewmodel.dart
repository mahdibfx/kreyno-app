import 'package:stacked/stacked.dart';

class AddVehiculeViewModel extends BaseViewModel {
  bool isFrenchLicensePlate = true;
  changePlateType() {
    isFrenchLicensePlate = !isFrenchLicensePlate;
    notifyListeners();
  }
}
