import 'package:dio/dio.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/api/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'api_reservation_service.g.dart';

@RestApi()
abstract class ApiReservationService {
  factory ApiReservationService(Dio dio) = _ApiReservationService;

  @POST(ApiEndpoints.reservations)
  Future<ApiResponse<Reservation>> createReservation(
    @Body() Map<String, dynamic> reservationMap,
  );

  @GET(ApiEndpoints.reservations)
  Future<ApiResponse<List<Reservation>>> getReservations(
    @Query('from') DateTime? from,
    @Query('to') DateTime? to,
  );

  @POST('${ApiEndpoints.reservations}/{id}/cancel')
  Future<ApiResponse<void>> cancelReservation(
    @Path('id') int id,
    @Body() Map<String, dynamic> observationMap,
  );

  @POST('${ApiEndpoints.reservations}/{id}/confirm')
  Future<ApiResponse<void>> confirmReservation(@Path('id') int id);

  @POST('${ApiEndpoints.reservations}/{id}/location')
  Future<ApiResponse<void>> buyerChangedLocation(
    @Path('id') int id,
    @Body() Map<String, dynamic> locationMap,
  );

  @POST('${ApiEndpoints.reservations}/{id}/complete')
  Future<ApiResponse<void>> completeReservation(@Path('id') int id);
}
