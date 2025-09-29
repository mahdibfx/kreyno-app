import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/enums/supported_language.dart';
import 'package:kreyno/services/picked_language_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SetUpLanguageViewModel extends BaseViewModel {
  final _logger = getLogger('SetUpLanguageViewModel');
  final BuildContext context;
  SetUpLanguageViewModel({required this.context});

  final _navigationService = locator<NavigationService>();
  final _pickedLanguageService = locator<PickedLanguageService>();

  void setSelectedLanguage(SupportedLanguage language) async {
    if (context.locale.languageCode == language.code) return;
    await context.setLocale(Locale(language.code, language.countryCode));
    rebuildUi();
  }

  void onContinuePressed() async {
    // Save the selected language using PickedLanguageService
    final currentLanguageCode = context.locale.languageCode;
    final selectedLanguage = SupportedLanguage.values.firstWhere(
      (lang) => lang.code == currentLanguageCode,
    );

    final saveResult = await _pickedLanguageService.savePickedLanguage(
      selectedLanguage,
    );

    saveResult.match(
      (error) {
        _logger.e('Error saving language', error: error);
      },
      (_) {
        _logger.i('Language saved successfully');
      },
    );

    await _navigationService.navigateToOnboardingView();
  }
}
