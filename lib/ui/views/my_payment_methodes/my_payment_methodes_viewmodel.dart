import 'package:dio/dio.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/dtos/action_on_payment_card_dto.dart';
import 'package:kreyno/models/card.dart';
import 'package:kreyno/services/stripe_service.dart';
import 'package:stacked/stacked.dart';

class MyPaymentMethodesViewModel extends BaseViewModel {
  final stripService = locator<StripeService>();
  final List<Card> myCards = [
    const Card(
      id: "00",
      brand: "Visa",
      last4: "8473",
      expMonth: "05",
      expYear: "2025",
    )
  ];

  Future<void> getMyCards() async {
    try {
      setBusy(true);
      final result = await stripService.getMyCards();
      if (result.success) {
        final responseCards = result.data;
        myCards
          ..clear()
          ..addAll(responseCards);
        notifyListeners();
      } else {
        // TODO: handle backend errors (result.message or similar)
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        // TODO: show internet error screen
      }
    } catch (e) {
      // TODO: show generalized error screen
    } finally {
      setBusy(false);
    }
  }

  Future<void> setDefaultCard(String paymentMethodId) async {
    try {
      setBusy(true);
      final dto = ActionOnPaymentCardDto(paymentMethodId: paymentMethodId);
      final result = await stripService.setDefaultCard(dto);
      if (result.success) {
        await getMyCards();
      } else {
        // TODO: handle backend errors
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        // TODO: show internet error screen
      }
    } catch (e) {
      // TODO: show generalized error screen
    } finally {
      setBusy(false);
    }
  }

  Future<void> removeCard(String paymentMethodId) async {
    try {
      setBusy(true);
      final dto = ActionOnPaymentCardDto(paymentMethodId: paymentMethodId);
      final result = await stripService.removeCard(dto);
      if (result.success) {
        myCards.removeWhere((c) => c.id == paymentMethodId);
        notifyListeners();
      } else {
        // TODO: handle backend errors
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        // TODO: show internet error screen
      }
    } catch (e) {
      // TODO: show generalized error screen
    } finally {
      setBusy(false);
    }
  }

  void onMenuPressed(String result, Card card) {
    if (result == 'p') {
      setDefaultCard(card.id);
    } else if (result == 's') {
      removeCard(card.id);
    }
  }
}
