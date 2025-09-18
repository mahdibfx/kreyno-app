import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MyVehiculesViewModel extends BaseViewModel {
  int principlaCarId = 0;
  onMenuTap(String result, int carId) {
    if (result == 'p') {
      principlaCarId = carId;
      notifyListeners();
    }
    if (result == 'm') {
      //edit
      locator<NavigationService>().navigateToModifyVehiculeView();
    }
  }
}
