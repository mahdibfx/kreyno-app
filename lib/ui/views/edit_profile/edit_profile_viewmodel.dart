import 'package:stacked/stacked.dart';

class EditProfileViewModel extends BaseViewModel {
  String sexe = 'female'; // either female or male ;
  sexChanged(String selectedSexe) {
    sexe = selectedSexe;
    notifyListeners();
  }
}
