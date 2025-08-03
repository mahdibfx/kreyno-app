import 'package:stacked/stacked.dart';

class PhoneInputFieldModel extends BaseViewModel {
  String _countryCode = '+33';
  String get countryCode => _countryCode;

  void setCountryCode(String countryCode) {
    _countryCode = countryCode;
    rebuildUi();
  }

  void onCountryCodeTapped() {
    // TODO: Implement country code picker once it is designed
  }
}
