import 'package:dio/dio.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/api/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';
part 'api_reservations_service.g.dart';

@RestApi()
abstract class ApiReservationsService {
  factory ApiReservationsService(Dio dio) = _ApiReservationsService;

  @GET(ApiEndpoints.reservations)
  Future<ApiResponse<List<Reservation>>> getUserReservations();
}
