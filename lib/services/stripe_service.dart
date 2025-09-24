import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/dtos/action_on_payment_card_dto.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/models/card.dart';
import 'package:kreyno/services/api/api_stripe_service.dart';
import 'package:kreyno/services/api/dio_service.dart';

class StripeService {
  final _apiService = ApiStripeService(locator<DioService>().dio);

  Future<ApiResponse<List<Card>>> getMyCards() async {
    try {
      final result = await _apiService.getCards();
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> setDefaultCard(ActionOnPaymentCardDto actionDto) async {
    try {
      final result = await _apiService.setDefaultCard(actionDto);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> removeCard(ActionOnPaymentCardDto actionDto) async {
    try {
      final result = await _apiService.removeCard(actionDto);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
