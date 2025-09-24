import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/enums/supported_language.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SetUpLanguageViewModel extends BaseViewModel {
  final BuildContext context;
  SetUpLanguageViewModel({required this.context});

  final _navigationService = locator<NavigationService>();

  void setSelectedLanguage(SupportedLanguage language) async {
    if (context.locale.languageCode == language.code) return;
    await context.setLocale(Locale(language.code, language.countryCode));
    rebuildUi();
  }

  void onContinuePressed() async {
    await _navigationService.navigateToOnboardingView();
  }
}
