import 'package:stacked/stacked.dart';

class HomeFilterSheetModel extends BaseViewModel {
  bool? possibleElectric;

  final double speed = 30; // km/h
  double time = 5; // minutes

  // Initial radius value (computed for 30 km/h and 5 minutes)
  double radius = 2.5; // km

  void updateTime(double newTime) {
    time = newTime;
    radius = speed * (time / 60); // km
    notifyListeners();
  }
}
