import 'package:dio/dio.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/api/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'api_reservation_service.g.dart';

@RestApi()
abstract class ApiReservationService {
  factory ApiReservationService(Dio dio) = _ApiReservationService;

  @GET(ApiEndpoints.reservations)
  Future<ApiResponse<List<Reservation>>> getReservations(
    @Query('from') DateTime? from,
    @Query('to') DateTime? to,
  );
}
