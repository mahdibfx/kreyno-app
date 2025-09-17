import 'package:stacked/stacked.dart';

class HomeFilterSheetModel extends BaseViewModel {
  double sliderValue = 0.2;
  int placeType = 0;
  changePlaceType(int placeTypeValue) {
    placeType = placeTypeValue;
    notifyListeners();
  }

  onSliderChange(double value) {
    sliderValue = value;
    notifyListeners();
  }
}
