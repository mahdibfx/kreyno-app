import 'package:kreyno/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// TODO: implement the logic to setup the vehicule
// TODO: implement the logic to resume the setup vehicule
class SetUpVehiculeViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

  bool _isFrenchLicensePlate = true;

  bool get isFrenchLicensePlate => _isFrenchLicensePlate;

  void setIsFrenchLicensePlate(bool value) {
    _isFrenchLicensePlate = value;
    rebuildUi();
  }

  void goBack() {
    _navigationService.back();
  }
}
