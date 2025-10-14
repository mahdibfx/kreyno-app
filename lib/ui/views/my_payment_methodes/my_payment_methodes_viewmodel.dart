import 'package:kreyno/app/app.dialogs.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/models/card.dart';
import 'package:kreyno/services/stripe_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// pagination was not implemented dues to the time constraint
// pull to refresh was not implemented dues to the time constraint
class MyPaymentMethodesViewModel extends BaseViewModel {
  final _logger = getLogger('MyPaymentMethodesViewModel');
  final _navigationService = locator<NavigationService>();
  final _stripeService = locator<StripeService>();
  final _toastService = locator<ToastService>();
  final _dialogService = locator<DialogService>();

  List<Card> _cards = [];
  List<Card> get cards => _cards;

  bool _actionInProgress = false;
  bool get actionInProgress => _actionInProgress;

  void setActionInProgress(bool value) {
    _actionInProgress = value;
    rebuildUi();
  }

  void setCards(List<Card> cards) {
    _cards = cards;
    rebuildUi();
  }

  Future<void> getAllCards() async {
    setError(null);
    setBusy(true);
    try {
      final allCardsResponse = await _stripeService.getCards();
      await allCardsResponse.match(
        (error) async {
          _logger.e('Error fetching all cards', error: error);
          setError(error);
        },
        (cards) async {
          setCards(cards);
        },
      );
    } finally {
      setBusy(false);
    }
  }

  void goBack() {
    _navigationService.back();
  }

  void onAddNewCardTapped() async {
    setActionInProgress(true);
    try {
      final setupIntentResponse = await _stripeService.getSetupIntent();

      await setupIntentResponse.match(
        (error) async => _toastService.showError(title: error),
        (setupIntent) async =>
            await _processPaymentFlow(setupIntent.clientSecret),
      );
    } finally {
      setActionInProgress(false);
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
        setCards([...cards, card]);
        _logger.i('Card added successfully: ${card.id}');
      },
    );
  }

  void onSetDefaultCardTapped(String cardId) async {
    final previousCards = List<Card>.from(cards);

    setCards(
      cards
          .map(
            (listCard) => listCard.id == cardId
                ? listCard.copyWith(isDefault: true)
                : listCard.copyWith(isDefault: false),
          )
          .toList(),
    );

    final result = await _stripeService.setDefaultCard(cardId);
    await result.match((error) async {
      _logger.e('Error setting default card', error: error);
      setCards(previousCards);
      _toastService.showError(title: error, showIcon: true);
    }, (_) async {});
  }

  void onDeleteCardTapped(String cardId) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.destructive,
      title: MyPaymentMethodesStrings.deleteCardDialogTitle,
      description: MyPaymentMethodesStrings.deleteCardDialogDescription,
      mainButtonTitle: MyPaymentMethodesStrings.deleteCardDialogMainButton,
      secondaryButtonTitle:
          MyPaymentMethodesStrings.deleteCardDialogSecondaryButton,
    );
    if (response != null && response.confirmed == true) {
      await _deleteCard(cardId);
    }
  }

  Future<void> _deleteCard(String cardId) async {
    setActionInProgress(true);
    try {
      final result = await _stripeService.removeCard(cardId);
      await result.match(
        (error) async {
          _logger.e('Error deleting card', error: error);
          _toastService.showError(title: error, showIcon: true);
        },
        (_) async {
          setCards(cards.where((card) => card.id != cardId).toList());
          _toastService.showSuccess(
            title: MyPaymentMethodesStrings.cardDeletedSuccessfully,
            showIcon: true,
          );
        },
      );
    } finally {
      setActionInProgress(false);
    }
  }
}
