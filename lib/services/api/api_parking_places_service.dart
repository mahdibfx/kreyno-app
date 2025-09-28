import 'package:dio/dio.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/models/parking_place.dart';
import 'package:kreyno/services/api/api_endpoints.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_parking_places_service.g.dart';

@RestApi()
abstract class ApiParkingPlacesService {
  factory ApiParkingPlacesService(Dio dio) = _ApiParkingPlacesService;

  @GET(ApiEndpoints.parkingPlaces)
  Future<ApiResponse<List<ParkingPlace>>> getUserParkingPlaces();
}
