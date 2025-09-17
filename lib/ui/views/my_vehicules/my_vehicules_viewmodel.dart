import 'package:stacked/stacked.dart';

class MyVehiculesViewModel extends BaseViewModel {
  int principlaCarId = 0;
  onMenuTap(String result, int carId) {
    if (result == 'p') {
      principlaCarId = carId;
      notifyListeners();
    }
  }
}
