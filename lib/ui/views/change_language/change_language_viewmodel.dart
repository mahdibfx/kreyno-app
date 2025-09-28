import 'package:stacked/stacked.dart';

class ChangeLanguageViewModel extends BaseViewModel {
  String selectedLanguage = 'FR';
  void changeLanguage(String lang) {
    //change language logic
    selectedLanguage = lang;
    notifyListeners();
  }
}
