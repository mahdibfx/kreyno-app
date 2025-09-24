import 'package:dio/dio.dart';
import 'package:kreyno/dtos/action_on_payment_card_dto.dart';
import 'package:kreyno/dtos/create_stripe_account_dto.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/models/card.dart';
import 'package:kreyno/models/setup_intent_response.dart';
import 'package:kreyno/services/api/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'api_stripe_service.g.dart';

@RestApi()
abstract class ApiStripeService {
  factory ApiStripeService(Dio dio) = _ApiStripeService;

  @POST(ApiEndpoints.setupIntent)
  Future<ApiResponse<SetupIntentResponse>> getSetupIntent();

  @GET(ApiEndpoints.cards)
  Future<ApiResponse<List<Card>>> getCards();

  @POST(ApiEndpoints.saveCard)
  Future<ApiResponse<Card>> saveCard(@Body() ActionOnPaymentCardDto actionDto);

  @POST(ApiEndpoints.setDefaultCard)
  Future<ApiResponse> setDefaultCard(@Body() ActionOnPaymentCardDto actionDto);

  @DELETE(ApiEndpoints.removeCard)
  Future<ApiResponse> removeCard(@Body() ActionOnPaymentCardDto actionDto);

  @POST(ApiEndpoints.stripeAccount)
  Future<ApiResponse> createAccount(
    @Body() CreateStripeAccountDto createStripeAccountDto,
  );

  @GET(ApiEndpoints.stripeAccount)
  Future<ApiResponse> getAccount();
}
