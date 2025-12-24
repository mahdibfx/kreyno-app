import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_stripe/flutter_stripe.dart' hide Card;
import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/models/card.dart';
import 'package:kreyno/models/parking_spot.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/location_service.dart';
import 'package:kreyno/services/reservations_service.dart';
import 'package:kreyno/services/stripe_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PayForSpotSheetModel extends BaseViewModel {
  final _stripeService = locator<StripeService>();
  final _navigationService = locator<NavigationService>();
  final _locationService = locator<LocationService>();

  final _logger = getLogger('PayForSpotSheetModel');
  final _toastService = locator<ToastService>();
  final _reservationService = locator<ReservationsService>();
  bool paymentSubmitted = false;
  String paymentMethodId = "";
  bool _actionInProgress = false;
  bool get actionInProgress => _actionInProgress;

  List<Card> _cards = [];
  List<Card> get cards => _cards;

  String getDistanceToSpot(ParkingSpot parkingSpot) {
    final currentLocation = _locationService.currentLocation;
    if (currentLocation == null) return "0 km";
    final distanceInMeters = Geolocator.distanceBetween(
      currentLocation.latitude,
      currentLocation.longitude,
      parkingSpot.latitude,
      parkingSpot.longitude,
    );
    return "${(distanceInMeters / 1000).toStringAsFixed(1)} km";
  }

  selectPaymentMethod(Card card) {
    paymentMethodId = card.id;
    rebuildUi();
  }

  void setActionInProgress(bool value) {
    _actionInProgress = value;
    rebuildUi();
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
        selectPaymentMethod(card);
        setCards([...cards, card]);
        _logger.i('Card added successfully: ${card.id}');
      },
    );
  }

  goToPaymentPart() {
    paymentSubmitted = true;
    rebuildUi();
  }

  void setCards(List<Card> cards) {
    _cards = cards;
    if (_cards.length == 1) {
      selectPaymentMethod(_cards.first);
    }
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

  paySubmitted(ParkingSpot parkingSpot) async {
    final reservation = await _reservationService.createReservation(
      parkingSpot.id,
      paymentMethodId,
    );

    _handleReservationResult(reservation);
    return;
  }

  _handlePaymentResult(
    Either<String, PaymentIntent> paymentResult,
    ParkingSpot parkingSpot,
    String paymentMethodId,
  ) {
    paymentResult.match((error) => _toastService.showError(title: error), (
      intent,
    ) async {
      switch (intent.status) {
        case PaymentIntentsStatus.Succeeded:
          // إنشاء الحجز
          final reservation = await _reservationService.createReservation(
            parkingSpot.id,
            paymentMethodId,
          );

          _handleReservationResult(reservation);
          break;

        default:
          _toastService.showError(title: "common.error".tr());
      }
    });
  }

  _handleReservationResult(Either<String, Reservation> result) {
    result.match((l) => _toastService.showError(title: l), (r) {
      _navigationService.navigateToSellerTrackingView(reservation: r);
      // toastService.showSuccess(title: "payForSpot.reservationCreated".tr());
    });
  }
}
