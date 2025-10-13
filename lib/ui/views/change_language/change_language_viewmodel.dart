import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/enums/supported_language.dart';
import 'package:kreyno/services/picked_language_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChangeLanguageViewModel extends BaseViewModel {
  final _logger = getLogger('ChangeLanguageViewModel');
  final BuildContext context;
  ChangeLanguageViewModel({required this.context});

  final _navigationService = locator<NavigationService>();
  final _pickedLanguageService = locator<PickedLanguageService>();

  SupportedLanguage? _selectedLanguage;

  SupportedLanguage get selectedLanguage {
    return _selectedLanguage ??
        SupportedLanguage.values.firstWhere(
          (lang) => lang.code == context.locale.languageCode,
        );
  }

  bool get hasLanguageChanged {
    final currentLanguageCode = context.locale.languageCode;
    final selectedLanguageCode = selectedLanguage.code;
    return currentLanguageCode != selectedLanguageCode;
  }

  void setSelectedLanguage(SupportedLanguage language) {
    _selectedLanguage = language;
    rebuildUi();
  }

  void goBack() {
    _navigationService.back();
  }

  void onSavePressed() async {
    setBusy(true);
    try {
      final currentLanguageCode = context.locale.languageCode;
      final selectedLanguageCode = selectedLanguage.code;

      // Only apply locale change if language actually changed
      if (currentLanguageCode != selectedLanguageCode) {
        await context.setLocale(
          Locale(selectedLanguageCode, selectedLanguage.countryCode),
        );
      }

      final saveResult = await _pickedLanguageService.savePickedLanguage(
        selectedLanguage,
      );

      await saveResult.match(
        (error) async {
          _logger.e('Error saving language', error: error);
        },
        (_) async {
          _logger.i('Language saved successfully');
        },
      );

      await Future.delayed(const Duration(milliseconds: 500));
    } finally {
      setBusy(false);
    }
  }
}
