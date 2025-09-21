import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PhoneInputFieldModel extends BaseViewModel {
  final _logger = getLogger('PhoneInputFieldModel');
  final _bottomSheetService = locator<BottomSheetService>();

  String _countryDialCode = '+33';
  String get countryDialCode => _countryDialCode;

  String _countryCode = 'FR';
  String get countryCode => _countryCode;

  void setCodes(String countryDialCode, String countryCode) {
    _countryDialCode = countryDialCode;
    _countryCode = countryCode;
    rebuildUi();
  }

  void onCountryCodeTapped() async {
    // TODO: Implement country code picker once it is designed
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.countryCodePicker,
      barrierColor: Colors.black.withValues(alpha: .1),
      ignoreSafeArea: false,
      isScrollControlled: true,
    );

    if (response != null && response.confirmed) {
      _logger.i(
        'country code selected: ${response.data.$1} ${response.data.$2}',
      );
      setCodes(response.data.$1, response.data.$2);
    }
  }
}
