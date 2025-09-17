import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final BuildContext context;
  StartupViewModel({required this.context});

  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    var isLanguagePicked = context.savedLocale != null;
    await Future.delayed(const Duration(seconds: 3));

    if (!isLanguagePicked) {
      await _navigationService.replaceWithSetUpLanguageView();
    } else {
      await _navigationService.replaceWithOnboardingView();
    }
  }
}
