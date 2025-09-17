import 'package:stacked/stacked.dart';

class MyStationementsViewModel extends BaseViewModel {
  int selectedIndex = 0;
  changeIndex(int i) {
    selectedIndex = i;
    notifyListeners();
  }
}
