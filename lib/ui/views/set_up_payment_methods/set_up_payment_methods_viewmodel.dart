import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/models/card.dart';
import 'package:kreyno/services/analytics_service.dart';
import 'package:kreyno/services/stripe_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SetUpPaymentMethodsViewModel extends BaseViewModel {
  final _logger = getLogger('SetUpPaymentMethodsViewModel');
  final _toastService = locator<ToastService>();
  final _stripeService = locator<StripeService>();
  final _navigationService = locator<NavigationService>();
  final _analyticsService = locator<AnalyticsService>();

  Card? _savedCard;
  Card? get savedCard => _savedCard;
  bool get hasSavedCard => _savedCard != null;

  void goBack() {
    _toastService.showInfo(
      title: SetUpPaymentMethodsStrings.savePaymentMethodsToMoveToNextStep,
      showIcon: true,
    );
  }

  void onSkipTapped() async {
    // Funnel step 5, skipped branch.
    await _analyticsService.paymentStep(skipped: true);
    _navigateToPermissionsView();
  }

  void onContinueTapped() async {
    // Funnel step 5. `hasSavedCard` is what actually distinguishes a card
    // having been added from the user tapping past an empty screen.
    await _analyticsService.paymentStep(skipped: !hasSavedCard);
    _navigateToPermissionsView();
  }

  void _navigateToPermissionsView() async {
    _navigationService.navigateToSetUpPermissionsView();
  }

  void onAddCardTapped() async {
    setBusy(true);
    try {
      final setupIntentResponse = await _stripeService.getSetupIntent();

      await setupIntentResponse.match(
        (error) async => _toastService.showError(title: error),
        (setupIntent) async =>
            await _processPaymentFlow(setupIntent.clientSecret),
      );
    } finally {
      setBusy(false);
    }
  }

  Future<void> _processPaymentFlow(String clientSecret) async {
    final initResult = await _stripeService.initializePaymentSheet(
      clientSecret: clientSecret,
    );

    await initResult.match(
      (error) async => _toastService.showError(title: error),
      (_) async {
        final presentResult = await _stripeService.presentPaymentSheet();

        await presentResult.match((error) async {
          if (error.isNotEmpty) {
            _toastService.showError(title: error);
          }
        }, (_) async => await _retrieveAndSaveCard(clientSecret));
      },
    );
  }

  Future<void> _retrieveAndSaveCard(String clientSecret) async {
    final paymentMethodResult = await _stripeService.retrievePaymentMethodId(
      clientSecret,
    );

    await paymentMethodResult.match(
      (error) async => _toastService.showError(title: error),
      (paymentMethodId) async => await _saveCardToBackend(paymentMethodId),
    );
  }

  Future<void> _saveCardToBackend(String paymentMethodId) async {
    final saveCardResponse = await _stripeService.saveCard(paymentMethodId);

    await saveCardResponse.match(
      (error) async => _toastService.showError(title: error),
      (card) async {
        _toastService.showSuccess(
          title: SetUpPaymentMethodsStrings.cardAddedSuccessfully,
        );
        _savedCard = card;
        rebuildUi();
        _logger.i('Card added successfully: ${card.id}');
      },
    );
  }
}
